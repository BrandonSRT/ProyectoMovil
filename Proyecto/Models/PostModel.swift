//
//  PostModel.swift
//  Proyecto
//
//  Created by user204403 on 10/21/21.
//

import Foundation

struct PostModel: Encodable, Decodable{
    
    var caption: String
    var likes: [String: Bool]
    var geoLocation: String
    var ownerId: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
}
