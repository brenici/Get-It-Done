//
//  TaskListViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import Foundation

/// The class serves as ViewModel for the `TaskListView`
///
/// The class handles the data and logic for managing tasks in the `TaskListView`.
///
final class TaskListViewModel: ObservableObject {
    
    @Published var isShowingNewTaskView = false
    @Published var tasks: [_Task] = []
    
    private var storageManager = StorageManager.shared
    
    private let userId: String
    
    /// Initializes the ViewModel with the `userId`
    /// - Parameter userId: user ID
    init(userId: String) {
        self.userId = userId
        getAllTasks(for: userId)
    }
        
    /// Retrieves all tasks for a specific user.
    /// - Parameter userId: The user ID of the logged-in user.
    private func getAllTasks(for userId: String) {
        storageManager.fetchTasks(for: userId) { [weak self] result in
            switch result {
                case .success(let tasks):
                    self?.tasks = tasks
                case .failure(let error):
                    print("Error: Failed to fetch data. \(error.localizedDescription)")
            }
        }
    }
    
    /// Sorts tasks based on `sortOption`
    /// - Parameter sortOption: the selected sortOption as defined in SortOption enum
    /// - Returns: an array of sorted tasks
    public func sortedTasks(by sortOption: SortOption) -> [_Task] {
        return sortOption.sort(tasks: tasks)
    }
    
    // TODO: all CRUD methods
    
    func getTask(taskId: String) {}
    
    func updateTask(taskId: String) {}
    
    /// Deletes a task of the current user
    /// - Parameter taskId: task ID
    public func deleteTask(with taskId: String) {
        storageManager.deleteTask(taskId, for: userId)
    }
    
    // TODO: Move to user account view
    
    /// Performs the log out of the current user
    public func logOut() {
        AuthManager.shared.signOut()
    }

}
