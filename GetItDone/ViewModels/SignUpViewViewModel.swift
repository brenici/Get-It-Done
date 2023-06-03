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
    
    public func login() {
        guard validateSignUpForm() else {
            print("Sign-up Form Validation Error")
            return
        }
        print("Signing Up ...")
        // Attempt to sign-up...
    }
    
    private func validateSignUpForm() -> Bool {
        print("Validate Sign-up Form Entries")
        return true
    }
    
}
