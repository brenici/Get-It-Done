//
//  StringExtension.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

extension String {

    /// Check if the string represents a valid email address.
    ///
    /// - Returns: A Boolean value indicating that the string is a valid email address.
    var isValidEmail: Bool {
        guard !self.isEmpty else {
            return false
        }
        let emailRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
}
