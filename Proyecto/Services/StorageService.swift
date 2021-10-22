//
//  StorageService.swift
//  Proyecto
//
//  Created by user204403 on 10/17/21.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import UIKit




class StorageService{
    static var storage = Storage.storage()
    static var storageRoot =  storage.reference()
    
    static var storageProfile = storageRoot.child("profile")
    
    static var storagePost = storageRoot.child("posts")
 
    static func storageProfileId(userId:String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func storagePostId(postId:String) -> StorageReference {
        return storagePost.child(postId)
    }
    
    
    static func saveProfileImage(userId:String, username:String, email:String, imageData:Data, metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) -> Void, onError: @escaping(_ erroMessage: String) -> Void){
        
        storageProfileImageRef.putData(imageData, metadata: metaData){
            (StorageMetadata, error) in
            if error != nil{
                onError(error!.localizedDescription)
                return
            }
            storageProfileImageRef.downloadURL{
                (url, error) in
                if let metaImageUrl = url?.absoluteString{
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges{
                            (error) in
                            if error != nil {
                                onError(error!.localizedDescription)
                                return
                            }
                        }
                    }
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    let user = User.init(uid: userId, email: email, imageUrl: metaImageUrl, username: username, searchName: username.splitString(), biography: "")
                    guard let dict = try?user.asDictionary() else {return}
                    firestoreUserId.setData(dict){
                        (error) in
                        if error != nil{
                            onError(error!.localizedDescription)
                        }
                    }
                    
                    onSuccess(user)
                }
            }
        }
        
    }
    static func savePostPhoto(userId:String, caption: String, postId: String, imageData: Data, metadata: StorageMetadata, storagePostRef: StorageReference, onSuccess: @escaping() -> Void, onError: @escaping(_ erroMessage: String) -> Void){
        let number = Int.random(in: 0..<100)
        storagePostRef.putData(imageData, metadata: metadata){
            (StorageMetadata, error) in
            if error != nil{
                onError(error!.localizedDescription)
                return
            }
            storagePostRef.putData(imageData, metadata: metadata){
                (StorageMetadata, error) in
                if error != nil{
                    onError(error!.localizedDescription)
                    return
                }
                storagePostRef.downloadURL{
                    (url, error) in
                    if let metaImageUrl = url?.absoluteString{
                        let firestorePostRef = PostService.PostsUserId(userId: userId).collection("posts").document(postId)
                        
                        let post = PostModel.init(caption: caption, likes: [:], geoLocation: "", ownerId: userId, postId: postId, username: Auth.auth().currentUser!.displayName!, profile: Auth.auth().currentUser!.photoURL!.absoluteString, mediaUrl: metaImageUrl, date: Date().timeIntervalSince1970, likeCount: number)
                        
                        guard let dict = try? post.asDictionary() else {return}
                        
                        firestorePostRef.setData(dict){
                            (error) in
                            if error != nil{
                                onError(error!.localizedDescription)
                                return
                            }
                            
                            PostService.timelineUserId(userId: userId).collection("timeline").document(postId).setData(dict)
                            PostService.AllPosts.document(postId).setData(dict)
                            onSuccess()
                        }
                    }
                }
            }
        }
        
    }
}
