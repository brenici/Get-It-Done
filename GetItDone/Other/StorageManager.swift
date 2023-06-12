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
    private let tasksCollectionKey = "tasks"

    private let db = Firestore.firestore()

    // MARK: - Task Storage

    public func fetchTasks(for userId: String, completion: @escaping (Result<[_Task], Error>) -> Void) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(tasksCollectionKey)
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
                let tasks = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: _Task.self)
                }
                completion(.success(tasks))
            }
    }

    public func createTask(_ task: _Task, for userId: String) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(tasksCollectionKey)
            .document(task.id)
            .setData(task.asDictionary())
    }
    
    public func updateTask(_ task: _Task, for userId: String) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(tasksCollectionKey)
            .document(task.id)
            .setData(task.asDictionary())
    }

    public func deleteTask(_ taskId: String, for userId: String) {
        db.collection(usersCollectionKey)
            .document(userId)
            .collection(tasksCollectionKey)
            .document(taskId)
            .delete()
    }
    
    // MARK: - User Storage
    
    /// Updates the user data.
    public func updateUser(with userObject: User) {
        db.collection(usersCollectionKey)
            .document(userObject.id)
            .setData(userObject.asDictionary())
    }
        
}
