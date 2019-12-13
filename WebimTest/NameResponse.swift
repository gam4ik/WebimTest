//
//  NameResponse.swift
//  WebimTest
//
//  Created by Gamid on 13.12.2019.
//  Copyright © 2019 Gam4ik. All rights reserved.
//

import Foundation

struct NameResponseWrapped: Decodable {
    let response: NameResponse
}

struct NameResponse: Decodable {
    var firstName: String
}
