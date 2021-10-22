//
//  MainView.swift
//  Proyecto
//
//  Created by user204403 on 10/21/21.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var session: SessionStore
    @StateObject var profileService = ProfileService()

    var body: some View {
        ScrollView{
            VStack{
                ForEach(self.profileService.posts, id:\.postId){
                    (post) in

                    PostCardImage(post: post)
                    PostCard(post: post)
                }
            }

        }.navigationTitle("")
        .navigationBarHidden(true)
        .onAppear{
                self.profileService.loadUserPosts(userId: Auth.auth().currentUser!.uid)
        }
    }
}


