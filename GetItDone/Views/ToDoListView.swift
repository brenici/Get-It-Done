//
//  ToDoListView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

///  The view displays the ToDo items provided by the ViewModel.
///
struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    
    init() {}
    
    var body: some View {
        NavigationView {
            VStack {
                Text("No items...")
                Text("List of items...")
            }
            .navigationTitle("To Do List")
        }
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoListView()
    }

}
