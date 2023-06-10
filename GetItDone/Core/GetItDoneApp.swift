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
        removeFormBackground()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
    
    /// Removes the default background of a form or list.
    private func removeFormBackground() {
        UITableView.appearance().backgroundColor = .clear
    }
    
}
