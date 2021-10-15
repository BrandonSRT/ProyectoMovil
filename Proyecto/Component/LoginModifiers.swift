//
//  LoginModifiers.swift
//  Proyecto
//
//  Created by user204403 on 10/14/21.
//

import SwiftUI

struct LoginModifiers: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth:0, maxWidth: .infinity)
            .frame(height: 20)
            .padding()
            .foregroundColor(.white)
            .font(.system(size:14, weight: .bold))
            .background(Color.black)
            .cornerRadius(5.0)
    }

}


