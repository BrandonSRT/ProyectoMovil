//
//  HomeView.swift
//  Proyecto
//
//  Created by user204403 on 10/20/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        VStack{
            Text("Home view")
            Button(action: session.logout){
                Text("Log Out").font(.title)
                    .modifier(LoginModifiers())
                
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
