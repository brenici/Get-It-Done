//
//  MainView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

/// The main view of the app handling view navigation and responsible for presenting views based on user authentication.
struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
        
    var body: some View {
//        if is logged in {
        ToDoListView(userId: viewModel.currentUserId)
//        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
