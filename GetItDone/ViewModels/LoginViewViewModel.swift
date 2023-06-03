//
//  LoginViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    /// Initiates the sign-up process.
    public func login() {
        guard validateLoginForm() else {
            print("Login Form Validation Error")
            return
        }
        print("Attempting to log in ...")
        AuthManager.shared.login(with: email, password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success:
                        print("Successfully logged in")
                    case .failure(let error):
                        self?.errorMessage = "Please enter a valid email and password"
                        print("Login Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    /// Validates the entries in the login form.
    ///
    /// - Returns: A Boolean value indicating whether the login form entries are valid.
    private func validateLoginForm() -> Bool {
        print("Validating Login Form Entries")
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill out all fields!"
            return false
        }
        guard email.isValidEmail else {
            errorMessage = "Please enter a valid email!"
            return false
        }
        print("Login Form validation success")
        return true
    }
    
}
