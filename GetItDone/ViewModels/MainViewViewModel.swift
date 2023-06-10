//
//  MainViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import UIKit

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
        let loggedIn = authManager.isLoggedIn
        toggleNavigationBarAppearance(loggedIn)
        return loggedIn
    }
    
    /// Toggles the appearance of the navigation bar every time a user logs in or logs out.
    /// - Parameter loggedIn: A Boolean value indicating the logged-in state.
    /// - Note: If the user is not logged in, the navigation bar appearance is cleared to prevent interference with the log-in and sign-up `HeaderView`.
    private func toggleNavigationBarAppearance(_ loggedIn: Bool) {
        if loggedIn {
            UINavigationBar.appearance().restoreDefaultAppearance()
        } else {
            UINavigationBar.appearance().setClearAppearance()
        }
    }
    
}
