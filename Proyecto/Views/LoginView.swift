//
//  LoginView.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                Image(systemName: "camera").font(.system(size: 60,weight: .black, design: .monospaced))
                VStack(alignment: .leading){
                    Text("Welcome Back").font(.system(size: 32,weight: .heavy))
                    Text("SignIn To continue").font(.system(size: 16,weight: .medium))
                }
                    Login(value: $email, icon: "envelope.fill", placeholder: "E-mail")
                    Login(value: $password, icon: "lock.fill", placeholder: "Password", isSecure: true)
                    
                    Button(action: {}){
                        Text("Log In").font(.title)
                            .modifier(LoginModifiers())
                        
                    }
                HStack{
                    Text("Don't have an account?")
                    NavigationLink(destination: RegisterView()) {
                        Text("Sign up").font(.system(size: 20,weight: .semibold))
                            .foregroundColor(.black)
                    }
                }
                    
                
            }.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

