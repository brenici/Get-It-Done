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
    
    /// Signs up a new user
    func signUp(with fullName: String, _ email: String, _ password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            let newUser = User(
                id: userID,
                name: fullName,
                email: email,
                signupTime: Date().timeIntervalSince1970)
            self?.insert(newUser)
        }
    }
    
    // MARK: - Storage
    
    func insert(_ user: User) {
        db.collection("users")
            .document(user.id)
            .setData(user.asDictionary())
    }
    
}
