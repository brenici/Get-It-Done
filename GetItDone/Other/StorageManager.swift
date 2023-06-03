//
//  StorageManager.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

/// A singleton class responsible for managing data storage database-related functionality.
final class StorageManager {
    
    static let shared = StorageManager()

    private let usersCollectionKey = "users"
    private let itemsCollectionKey = "todoItems"

    private let db = Firestore.firestore()

    // MARK: - Items Storage

    // TODO: implement all crud operations

    public func fetchItems(for userId: String, completion: @escaping (Result<[ToDoItem], Error>) -> Void) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(itemsCollectionKey)
            .addSnapshotListener { (querySnapshot, error) in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    completion(.failure(error))
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("No documents found")
                    completion(.success([]))
                    return
                }
                let items = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: ToDoItem.self)
                }
                completion(.success(items))
            }
    }

    public func createItem(_ item: ToDoItem, for userId: String) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(itemsCollectionKey)
            .document(item.id)
            .setData(item.asDictionary())
    }
    
    public func updateItem(_ item: ToDoItem, for userId: String) {
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
