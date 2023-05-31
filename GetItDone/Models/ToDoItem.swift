//
//  ToDoItem.swift
//  GetItDone
//
//  Created by Emilian Brenici on 31/05/2023.
//

import Foundation

/// A struct representing a ToDo item.
///
/// - Note: `id` property should be a unique identifier for each `ToDoItem` instance.
struct ToDoItem: Codable, Identifiable, Hashable {
    
    let id: String
    let title: String
    let dueTime: TimeInterval
    let creationTime: TimeInterval
    var isDone: Bool
    
}
