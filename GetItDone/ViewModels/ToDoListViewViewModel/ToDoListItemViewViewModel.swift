//
//  ToDoListItemViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class ToDoListItemViewViewModel: ObservableObject {
    
    /// Toggles the isDone property of the item
    /// - Parameter item: the item to be updated
    public func toggleIsDone(for item: ToDoItem) {
        var updatedItem = item
        updatedItem.toggleIsDone(!item.isDone)
        save(updatedItem)
    }
    
    /// Saves the item changes and updates it in StorageManager
    /// - Parameter item: the updated item to be saved
    private func save(_ item: ToDoItem) {
        let userId = AuthManager.shared.currentUserId
        guard userId != "" else {
            return
        }
        StorageManager.shared.updateItem(item, for: userId)
    }

}
