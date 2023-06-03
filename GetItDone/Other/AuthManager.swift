//
//  AuthManager.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// A singleton class responsible for managing authentication-related functionality.
final class AuthManager {

    static let shared = AuthManager()
    
    private let db = Firestore.firestore()
    
    // MARK: - Authentication
    
    /// Attempts to log in an existing user
    func login(with email: String, _ password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    /// Signs up a new user
    func signUp(with fullName: String, _ email: String, _ password: String, completion: @escaping (Result<String?, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(result?.user.uid))
            }
        }
    }
    
    // MARK: - Storage
    
    func updateData(for user: User) {
        db.collection("users")
            .document(user.id)
            .setData(user.asDictionary())
    }
    
}
