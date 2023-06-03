//
//  ToDoListItemViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class ToDoListItemViewViewModel: ObservableObject {
    
    public func toggleIsDone(for item: ToDoItem) {
        print("Item \(item.id) done is toggled...")
        var updatedItem = item
        updatedItem.toggleIsDone(!item.isDone)
        save(updatedItem)
    }
    
    private func save(_ item: ToDoItem) {
        let userId = AuthManager.shared.currentUserId
        guard userId != "" else {
            return
        }
        StorageManager.shared.updateItem(item, for: userId)
    }

}
