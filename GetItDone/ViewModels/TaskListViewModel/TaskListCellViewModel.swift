//
//  TaskListCellViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class TaskListCellViewModel: ObservableObject {
    
    /// Toggles the isDone property of a task
    /// - Parameter task: the task to be updated
    public func toggleIsDone(for task: _Task) {
        var updatedTask = task
        updatedTask.toggleIsDone(!task.isDone)
        save(updatedTask)
    }
    
    /// Saves the task changes and updates it in StorageManager
    /// - Parameter task: the updated task to be saved
    private func save(_ task: _Task) {
        let userId = AuthManager.shared.currentUserId
        guard userId != "" else {
            return
        }
        StorageManager.shared.updateTask(task, for: userId)
    }

}
