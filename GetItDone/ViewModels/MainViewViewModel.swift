//
//  MainViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The class serves as ViewModel for the `MainView`
///
/// The class includes user authentication control and other functions
///
final class MainViewViewModel: ObservableObject {
    
    @Published var currentUserId: String = ""
    
    init() {}
    
    deinit {}

    // TODO: Add user authentication
    
}
