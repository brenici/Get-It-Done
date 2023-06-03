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
    @Published var errorMessage = ""
    
    func saveNewItem() {
        print("creating new item...")
        guard validate() else {
            return
        }
        let userId = AuthManager.shared.currentUserId
        let newItem = buildNewItem()
        StorageManager.shared.createItem(newItem, for: userId)
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
            errorMessage = "Please enter a title!"
            return false
        }
        guard isDueTimeValid(dueTime) else {
            errorMessage = "Ensure date and time are in the future!"
            return false
        }
        return true
    }
    
    private func isDueTimeValid(_ dueTime: Date) -> Bool {
        let minimumDueTime = Date() + (10 * 60) // + 10 minutes
        return dueTime >= minimumDueTime
    }
    
}
