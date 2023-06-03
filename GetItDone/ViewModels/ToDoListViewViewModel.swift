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
    
    @Published var isShowingNewItemView = false
    @Published var items: [ToDoItem] = []
    
    private var storageManager = StorageManager.shared
    
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
        storageManager.fetchItems(for: userId) { [weak self] result in
            switch result {
                case .success(let items):
                    self?.items = items
                case .failure(let error):
                    print("Error: Failed to fetch data. \(error.localizedDescription)")
            }
        }
    }
    
    // TODO: all CRUD methods
    
    func getItem(itemId: String) {}
    
    func updateItem(itemId: String) {}

    public func deleteItem(with itemId: String) {
        storageManager.deleteItem(itemId, for: userId)
    }
    
    public func sortedItems(by sortOption: SortOption) -> [ToDoItem] {
        return sortOption.sort(items: items)
    }
    
    // TODO: Move to user account view
    public func logOut() {
        AuthManager.shared.signOut()
    }

}
