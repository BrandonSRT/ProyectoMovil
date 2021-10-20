//
//  ContentView.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session: SessionStore

    func listen(){
        session.listen()
    }

    
    var body: some View {
        Group{
            if(session.session != nil){
                HomeView()
            }else{
                LoginView()
            }
        }.onAppear(perform: listen)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
