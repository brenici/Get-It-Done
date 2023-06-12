//
//  TaskListView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import SwiftUI

///  Displays the tasks provided by the ViewModel.
struct TaskListView: View {
    
    @StateObject var viewModel: TaskListViewModel
    @State private var sortOption = SortOption.created
    
    init(userId: String) {
        self._viewModel = StateObject(
            wrappedValue: TaskListViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                switch viewModel.tasks.count {
                    case 0:
                        noResultsView
                    default:
                        taskList
                }
                Button {
                    viewModel.logOut()
                } label: {
                    Text("Log out")
                }
                .tint(.red)
            }
            .navigationTitle("Task List")
            .toolbar {
                Button {
                    viewModel.isShowingNewTaskView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isShowingNewTaskView) {
                NewTaskView(isNewTaskViewPresented: $viewModel.isShowingNewTaskView)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    @ViewBuilder private var taskList: some View {
        let tasks = viewModel.sortedTasks(by: sortOption)
        List {
            Section(header: segmentedPickerView) {
                ForEach(tasks) { task in
                    TaskListCellView(task: task)
                        .swipeActions {
                            Button {
                                viewModel.deleteTask(with: task.id)
                            } label: {
                                Text("Delete")
                            }
                            .tint(Color.red)
                        }
                }
            }
        }
        .listStyle(.plain)
        .animation(.easeInOut, value: tasks)
//        .clipped()
    }
    
    /// A placeholder view to replace an empty task list.
    @ViewBuilder private var noResultsView: some View {
        VStack {
            Text("No Results")
                .font(.system(size: 50))
                .bold()
                .minimumScaleFactor(0.5)
            Text("Tap the \"+\" button to add a new task")
                .minimumScaleFactor(0.5)
            Spacer()
        }
        .foregroundColor(.gray).opacity(0.3)
    }
    
    /// A segmented picker view used for sorting of tasks
    @ViewBuilder private var segmentedPickerView: some View {
        if viewModel.tasks.count > 1 {
            Picker("Sort By", selection: $sortOption) {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Text(option.rawValue).tag(option)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(0)
        } else {
            EmptyView()
        }
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskListView(userId: "1234")
    }
    
}
