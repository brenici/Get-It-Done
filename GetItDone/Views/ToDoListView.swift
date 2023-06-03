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
                if viewModel.items.count > 0 {
                    toDoItemsList
                } else {
                    noItemsView
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Log out")
                }
                .tint(.red)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.isShowingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewItemView) {
                NewItemView(isNewItemPresented: $viewModel.isShowingNewItemView)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder private var toDoItemsList: some View {
        List(viewModel.items) { item in
            ToDoListItemView(item: item)
                .swipeActions {
                    Button {
                        viewModel.deleteItem(with: item.id)
                    } label: {
                        Text("Delete")
                    }
                    .tint(Color.red)
                }
        }
    }
    
    /// A placeholder view to replace the List with 0 items.
    @ViewBuilder private var noItemsView: some View {
        VStack {
            Text("No Items")
                .font(.system(size: 50))
                .bold()
                .minimumScaleFactor(0.5)
            Text("Tap the \"+\" button to add a new item")
                .minimumScaleFactor(0.5)
            Spacer()
        }
        .foregroundColor(.gray).opacity(0.3)
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoListView(userId: "1234")
    }
    
}
