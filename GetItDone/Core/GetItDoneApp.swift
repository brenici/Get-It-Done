//
//  GetItDoneApp.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI
import FirebaseCore

@main
struct GetItDoneApp: App {
    
    init() {
        FirebaseApp.configure()
        setupUI()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    /// Configuring and customizing the appearance of the app's UI elements.
    private func setupUI() {
        removeFormBackground()
        // more setup ...
    }
    
    /// Removes the default background of a form or list.
    private func removeFormBackground() {
        UITableView.appearance().backgroundColor = .clear
    }
    
}
