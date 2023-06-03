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
    
    public func login() {
        guard validateLoginForm() else {
            print("Login Form Validation Error")
            return
        }
        print("Login ...")
        // Attempt log in...
    }
    
    private func validateLoginForm() -> Bool {
        print("Validate Login Form Entries")
        return true
    }
    
}
