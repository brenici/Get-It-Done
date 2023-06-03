//
//  User.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

/// A struct representing a User.
///
/// - Note: `id` property should be a unique identifier for each `User` instance.
///
struct User: Codable {
    
    let id: String
    let name: String
    let email: String
    let signupTime: TimeInterval
    
}
