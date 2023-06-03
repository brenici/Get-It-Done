//
//  ToDoListViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The class serves as ViewModel for the `ToDoListView`
///
/// The class handles the data and logic for managing the `ToDoItems` in the `ToDoListView`.
///
final class ToDoListViewViewModel: ObservableObject {
    
    @Published var items: [ToDoItem] = []
    
    private let userId: String
    
    /// Initialized the ViewModel with the `userId`
    /// - Parameter userId: user ID
    init(userId: String) {
        self.userId = userId
        getAllItems(for: userId)
    }
        
    /// Retrieves all items for a specific user.
    ///
    /// - Parameter userId: The user ID of the logged-in user.
    ///
    ///  - Important: This method assigns an array of a mock item to the list of items.
    ///
    ///  - Note: Replace the mock item(s) with the actual implementation to fetch and populate the list of items for the logged in user.
    ///
    private func getAllItems(for userId: String) {
        let mockItem = ToDoItem(
            id: UUID().uuidString, // intentionally unique
            title: "To Do Item",
            dueTime: (Date() + (7 * 24 * 60 * 60)).timeIntervalSince1970,
            creationTime: Date().timeIntervalSince1970,
            isDone: false
        )
        self.items = Array.init(repeating: mockItem, count: 10) // Note: the ToDoItem id is the same for all items!
        // TODO: replace the mock items
    }
    
    // TODO: all CRUD methods

    func createItem() {}
    
    func getItem(itemId: String) {}
    
    func updateItem(itemId: String) {}

    func deleteItem(itemId: String) {}
    
    // TODO: Move to user account view
    public func logOut() {
        AuthManager.shared.signOut()
    }

}
