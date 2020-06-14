//
//  PostModel.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

typealias Posts = [Post]

struct Post: Codable {
    let userId, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userId, id, title, body
    }
}
