//
//  API.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.103"
    
    static let getName = "/method/account.getProfileInfo"
    static let getFriends = "/method/friends.get"
}
