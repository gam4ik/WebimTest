//
//  FriendsResponse.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import Foundation

struct FriendsResponseWrapped: Decodable {
    let response: FriendsResponse
}

struct FriendsResponse: Decodable {
    var items: [FriendsItem]
}

struct FriendsItem: Decodable {
    let firstName: String
}
