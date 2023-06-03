//
//  MainViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The class serves as ViewModel for the `MainView`
final class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    
    private var authManager = AuthManager.shared
    
    /// Initializes the view model and starts observing changes in Auth State.
    init() {
        authManager.addAuthStateChangeListener()
        authManager.$currentUserId.assign(to: &$currentUserId)
    }
    
    /// Deinitializes the view model and stop observing changes in Auth State.
    deinit {
        authManager.removeAuthStateChangeListener()
    }

    /// Indicates whether the user is currently logged in.
    /// - Returns: `true` if the user is logged in, `false` otherwise.
    public var isLoggedIn: Bool {
        return authManager.isLoggedIn
    }
    
}
