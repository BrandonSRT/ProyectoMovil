//
//  Profileheader.swift
//  Proyecto
//
//  Created by user204403 on 10/22/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct Profileheader: View {
    var user: User?
    var body: some View {
        HStack{
            VStack{
                if user != nil{
                    WebImage(url: URL(string: user!.imageUrl)!)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .padding(.leading)
                }else{
                    Color.init(red: 0.9, green: 0.9, blue: 0.9).frame(width: 100, height: 100, alignment: .trailing)
                        .padding()
                }
//                Text(user!.username).font(.headline).bold().padding(.leading)
            }
        
            VStack{
                HStack{
                    Spacer()
                    VStack{
                        Text("Followers").font(.headline)
                        Text("20").font(.title).bold()
                    }.padding(.top, 60)
                    Spacer()
                    VStack{
                        Text("Following").font(.headline)
                        Text("20").font(.title).bold()
                    }.padding(.top, 60)
                    Spacer()
                }
            }
        }
        
    }
}

struct Profileheader_Previews: PreviewProvider {
    static var previews: some View {
        Profileheader()
    }
}
