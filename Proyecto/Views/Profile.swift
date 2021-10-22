//
//  Profile.swift
//  Proyecto
//
//  Created by user204403 on 10/21/21.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var session: SessionStore
    @State private var selection = 1
    
    var body: some View {
        ScrollView{
        
            VStack{
                Profileheader(user: self.session.session)
                Button(action: {}){
                    Text("Edit Profile").font(.title)
                        .modifier(LoginModifiers())
                        .padding(.horizontal)
                    
                }
            }
        
        }.navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action:{}){
                Image(systemName: "person.fill")
            }, trailing: Button(action: {
                self.session.logout()
            }){
                Image(systemName: "arrow.right.circle.fill")
            })
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
