//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 2/10/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
