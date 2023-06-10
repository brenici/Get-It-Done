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
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onAppear {
                    
                    // prevent default NavigationBar appearance when scrolling up
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundEffect = nil
                    appearance.backgroundColor = .clear
                    appearance.backgroundImage = UIImage()
                    appearance.shadowImage = UIImage()
                    appearance.shadowColor = .clear
                    UINavigationBar.appearance().standardAppearance = appearance
                    
                    // prevent form default background
                    UITableView.appearance().backgroundColor = .clear
                }
        }
    }
    
}
