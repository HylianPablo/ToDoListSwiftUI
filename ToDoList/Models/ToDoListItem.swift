//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        self.isDone = state
    }
}
