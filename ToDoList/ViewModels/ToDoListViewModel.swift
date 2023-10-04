//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    
    private var userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("todos").document(id).delete()
    }
}
