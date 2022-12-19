//
//  UsersResponse.swift
//  PersonsApp
//
//  Created by Amby on 19/12/2022.
//

import Foundation

struct UsersResponse: Codable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}
