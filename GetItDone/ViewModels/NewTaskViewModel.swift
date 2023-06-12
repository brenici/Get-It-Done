//
//  NewTaskViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class NewTaskViewModel: ObservableObject {
    
    @Published var title = ""
    @Published var dueTime = Date()
    @Published var errorMessage = ""
    
    /// Saves the newly created task
    func saveNewTask() {
        guard validate() else {
            return
        }
        let userId = AuthManager.shared.currentUserId
        let newTask = buildNewTask()
        StorageManager.shared.createTask(newTask, for: userId)
    }
    
    /// Builds a new Task object based on title and dueTime and using a UUID unique id
    /// - Returns: Task object
    private func buildNewTask() -> _Task {
        return _Task(
            id: UUID().uuidString,
            title: title,
            dueTime: dueTime.timeIntervalSince1970,
            creationTime: Date().timeIntervalSince1970,
            isDone: false
        )
    }
    
    /// Verifies if the title and due time are valid
    /// - Returns: A Boolean value indicating whether the title and the due time are valid.
    public func validate() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter a title!"
            return false
        }
        guard isDueTimeValid(dueTime) else {
            errorMessage = "Ensure date and time are in the future!"
            return false
        }
        return true
    }
    
    /// Verifies if the due time is valid
    /// - Parameter dueTime: The due time expressed as `Date` value
    /// - Returns: A Boolean value indicating whether the date is at least 10 minutes in the future
    private func isDueTimeValid(_ dueTime: Date) -> Bool {
        let minimumDueTime = Date() + (10 * 60) // + 10 minutes
        return dueTime >= minimumDueTime
    }
    
}
