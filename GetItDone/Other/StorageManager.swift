//
//  StorageManager.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation
import FirebaseFirestore

/// A singleton class responsible for managing data storage database-related functionality.
final class StorageManager {
    
    static let shared = StorageManager()

    private let usersCollectionKey = "users"
    private let itemsCollectionKey = "todoItems"

    private let db = Firestore.firestore()

    // MARK: - Items Storage

    // TODO: implement all crud operations

    public func getAllItems() {}

    public func createItem(_ item: ToDoItem, for userId: String) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(itemsCollectionKey)
            .document(item.id)
            .setData(item.asDictionary())
    }

    public func getItem(id: String) {}

    public func updateItem(id: String) {}

    public func deleteItem(id: String) {}
    
    // MARK: - User Storage
    
    /// Updates the user data.
    public func updateUser(with userObject: User) {
        db.collection(usersCollectionKey)
            .document(userObject.id)
            .setData(userObject.asDictionary())
    }
    
    // TODO: add other crud operations
    
}
