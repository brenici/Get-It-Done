//
//  AuthManager.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation
import FirebaseAuth

/// A singleton class responsible for managing authentication-related functionality.
final class AuthManager {

    static let shared = AuthManager()
    
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    public var isLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    
    // MARK: - Initialization
    
    private init() {
        addAuthStateChangeListener()
    }
    
    deinit {
        removeAuthStateChangeListener()
    }
    
    // MARK: - Authentication state observer

    /// Starts observing changes in the authentication state.
    /// - Parameter completion: A closure to be called when the authentication state changes. The closure receives a boolean value indicating if the user is logged in or not.
    ///
    public func addAuthStateChangeListener() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    /// Stops observing changes in the authentication state.
    public func removeAuthStateChangeListener() {
        if let handler = handler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
    
    // MARK: - Authentication
    
    /// Attempts to log in an existing user
    public func login(with email: String, _ password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    /// Signs up a new user
    public func signUp(with fullName: String, _ email: String, _ password: String, completion: @escaping (Result<String?, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(result?.user.uid))
            }
        }
    }
    
    /// Signs out the currently logged in user.
    public func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    
}
