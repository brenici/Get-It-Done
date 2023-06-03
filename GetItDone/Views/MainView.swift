//
//  MainView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The main view of the app
///
/// Presents the views based on user authentication.
struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn && !viewModel.currentUserId.isEmpty {
            ToDoListView(userId: viewModel.currentUserId)
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
