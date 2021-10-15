//
//  Login.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI

struct Login: View {
    @Binding var value: String
    var icon:String
    var placeholder: String
    var isSecure = false
    
    var body: some View{
        Group{
            HStack{
                Image(systemName: icon).padding()
                Group{
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    }else{
                        TextField(placeholder, text: $value)
                    }
                }.font(Font.system(size: 20, design: .monospaced))
                    .foregroundColor(.black)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
            }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 4)).padding()
        }
    }
    
    
}



struct Login_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
