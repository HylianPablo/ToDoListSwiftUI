//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
