//
//  User.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
