//
//  SignUpViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class SignUpViewViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var repeatedPassword = ""
    
    /// Initiates the sign-up process.
    public func signUp() {
        guard validateSignUpForm() else {
            print("Sign-up Form Validation Error")
            return
        }
        print("Attempting to sign up ...")
        AuthManager.shared.signUp(with: fullName, email, password) { [weak self]result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let userId):
                        print("Successfully signed up")
                        guard let id = userId else {
                            return
                        }
                        let newUser = User(
                            id: id,
                            name: self?.fullName ?? "",
                            email: self?.email ?? "",
                            signupTime: Date().timeIntervalSince1970)
                        print("Adding signup time")
                        StorageManager.shared.updateUser(with: newUser)
                    case .failure(let error):
                        print("Login Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// Validates the entries in the sign-up form.
    ///
    /// - Returns: A Boolean value indicating whether the sign-up form entries are valid.
    private func validateSignUpForm() -> Bool {
        print("Validating Sign-up Form Entries")
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !repeatedPassword.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            print("Please fill out all fields!")
            return false
        }
        guard email.isValidEmail else {
            print("Please enter a valid email!")
            return false
        }
        guard password.count >= 8 else {
            print("Password must be 8+ characters!")
            return false
        }
        guard password == repeatedPassword else {
            print("Passwords do not match!")
            return false
        }
        print("Sign-up Form validation success")
        return true
    }
    
}
