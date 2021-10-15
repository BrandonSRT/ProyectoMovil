//
//  ContentView.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    @State private var mail = ""
    @State private var password = ""

    
    var body: some View {
        VStack{
            Login(value: $mail, icon: "mail", placeholder: "E-mail")
            Login(value: $password, icon: "lock", placeholder: "password", isSecure: true)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
