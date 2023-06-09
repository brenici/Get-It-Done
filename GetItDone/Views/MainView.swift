//
//  MainView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The main view of the app
///
/// Presents the views based on user authentication:
/// - `LoginView` is presented if the user in not logged in
/// - `TaskListView` is presented only if the user in logged in
struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn && !viewModel.currentUserId.isEmpty {
            TaskListView(userId: viewModel.currentUserId)
        } else {
            LoginView()
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
