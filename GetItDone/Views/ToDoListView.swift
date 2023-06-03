//
//  ToDoListView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

///  Displays the ToDo items provided by the ViewModel.
struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    
    init(userId: String) {
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    VStack {
                        Text("Title: \(item.title)")
                        Text("Due time: " +
                             Date(timeIntervalSince1970: item.dueTime)
                                .formatted(date: .abbreviated, time: .shortened))
                        Text("Created: " +
                             Date(timeIntervalSince1970: item.creationTime)
                                .formatted(date: .abbreviated, time: .shortened))
                    }
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Log out")
                }
                .tint(.red)
            }
            .navigationTitle("To Do List")
        }
        .navigationViewStyle(.stack)
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoListView(userId: "1234")
    }

}
