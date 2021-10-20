//
//  UsersModel.swift
//  Proyecto
//
//  Created by user204403 on 10/17/21.
//

import Foundation


struct User: Encodable, Decodable{
    var uid: String
    var email: String
    var imageUrl: String
    var username: String
    var searchName: [String]
    var biography: String
    
}
