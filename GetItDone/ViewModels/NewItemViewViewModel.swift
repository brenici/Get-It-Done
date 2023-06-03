//
//  NewItemViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class NewItemViewViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueTime = Date()
    
    func saveNewItem() {
        print("creating new item...")
        guard validate() else {
            return
        }
        let userID = AuthManager.shared.currentUserId
        let newItem = buildNewItem()
        StorageManager.shared.createItem(newItem, for: userID)
    }
    
    /// Builds a new ToDoItem object based on title and dueTime and using a UUID unique id
    /// - Returns: ToDoItem object
    private func buildNewItem() -> ToDoItem {
        return ToDoItem(
            id: UUID().uuidString,
            title: title,
            dueTime: dueTime.timeIntervalSince1970,
            creationTime: Date().timeIntervalSince1970,
            isDone: false
        )
    }
        
    public func validate() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("Please enter a title!")
            return false
        }
        guard isDueTimeValid(dueTime) else {
            print("Ensure date and time are in the future!")
            return false
        }
        return true
    }
    
    private func isDueTimeValid(_ dueTime: Date) -> Bool {
        let minimumDueTime = Date() + (10 * 60) // + 10 minutes
        return dueTime >= minimumDueTime
    }
    
}
