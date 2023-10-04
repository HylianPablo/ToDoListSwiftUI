//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by Pablo Martinez Lopez on 3/10/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel: ObservableObject {
    
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
