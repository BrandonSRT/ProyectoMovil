//
//  ProfileService.swift
//  Proyecto
//
//  Created by user204403 on 10/22/21.
//

import Foundation


class ProfileService: ObservableObject{
    @Published var posts: [PostModel] = []
    
    func loadUserPosts(userId: String){
        PostService.loadUserPosts(userId: userId){
            (posts) in
            self.posts = posts
        }
    }
}
