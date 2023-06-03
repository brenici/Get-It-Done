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
        AuthManager.shared.signUp(with: fullName, email, password)
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
