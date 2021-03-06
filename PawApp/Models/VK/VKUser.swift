//
//  VKUser.swift
//  PawApp
//
//  Created by Guzel Gubaidullina on 17.05.2020.
//  Copyright © 2020 Guzel Gubaidullina. All rights reserved.
//

import Foundation
import RealmSwift

struct VKUserRequestResponse: Codable {
    let response: VKUserResponse
}

struct VKUserResponse: Codable {
    let items: [VKUser]
}

class VKUser: Object, Codable {
    override var description: String {
        return String(format: "%@ %@ (%ld)", firstName, lastName, userId)
    }
    
   @objc dynamic var userId: Int
   @objc dynamic var firstName: String
   @objc dynamic var lastName: String
   @objc dynamic var avatarUrl: String
   @objc dynamic var isOnline: Int
}

extension VKUser {
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case avatarUrl = "photo_200_orig"
        case isOnline = "online"
    }
}

