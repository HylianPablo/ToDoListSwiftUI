//
//  NewItemViewModel.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    let kSubtractSecondsInDay = -86400.0
    
    init() {}
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(kSubtractSecondsInDay) else {
            return false
        }
        return true
    }
    
    func save() {
        guard canSave,
              let uID = Auth.auth().currentUser?.uid else { return }
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
}
