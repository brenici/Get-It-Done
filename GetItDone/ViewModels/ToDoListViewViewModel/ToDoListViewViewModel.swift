//
//  ToDoListViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import Foundation

/// The class serves as ViewModel for the `ToDoListView`
///
/// The class handles the data and logic for managing the `ToDoItems` in the `ToDoListView`.
///
final class ToDoListViewViewModel: ObservableObject {
    
    @Published var isShowingNewItemView = false
    @Published var items: [ToDoItem] = []
    
    private var storageManager = StorageManager.shared
    
    private let userId: String
    
    /// Initializes the ViewModel with the `userId`
    /// - Parameter userId: user ID
    init(userId: String) {
        self.userId = userId
        getAllItems(for: userId)
    }
        
    /// Retrieves all items for a specific user.
    /// - Parameter userId: The user ID of the logged-in user.
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
    
    /// Sorts items based on `sortOption`
    /// - Parameter sortOption: the selected sortOption as defined in SortOption enum
    /// - Returns: an array of sorted items
    public func sortedItems(by sortOption: SortOption) -> [ToDoItem] {
        return sortOption.sort(items: items)
    }
    
    // TODO: all CRUD methods
    
    func getItem(itemId: String) {}
    
    func updateItem(itemId: String) {}
    
    /// Deletes an item of the current user
    /// - Parameter itemId: item ID
    public func deleteItem(with itemId: String) {
        storageManager.deleteItem(itemId, for: userId)
    }
    
    // TODO: Move to user account view
    
    /// Performs the log out of the current user
    public func logOut() {
        AuthManager.shared.signOut()
    }

}
