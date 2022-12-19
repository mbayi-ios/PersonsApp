//
//  Model.swift
//  PersonsApp
//
//  Created by Amby on 19/12/2022.
//

import Foundation

struct User: Codable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String

}

struct Support: Codable {
    let url: String?
    let text: String?
}
