//
//  User.swift
//  Engineer.aiDemo2
//
//  Created by PCQ177 on 02/01/20.
//  Copyright © 2020 PCQ177. All rights reserved.
//

import Foundation

struct UserDetail : Codable {
    let status : Bool?
    let message : String?
    let data : Userdata?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Userdata.self, forKey: .data)
    }
    
}

struct Userdata : Codable {
    let users : [Users]?
    let has_more : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case users = "users"
        case has_more = "has_more"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        users = try values.decodeIfPresent([Users].self, forKey: .users)
        has_more = try values.decodeIfPresent(Bool.self, forKey: .has_more)
    }
    
}
struct Users : Codable {
    let name : String?
    let image : String?
    let items : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case image = "image"
        case items = "items"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        items = try values.decodeIfPresent([String].self, forKey: .items)
    }
    
}
