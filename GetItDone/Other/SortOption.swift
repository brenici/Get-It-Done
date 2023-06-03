//
//  SortOption.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

enum SortOption: String, CaseIterable {
    
    case created = "Created"
    case title = "Title"
    case dueTime = "Due Time"
    case completed = "Completed"
    
    func sort(items: [ToDoItem]) -> [ToDoItem] {
        var sortedItems: [ToDoItem] = []
        switch self {
            case .created:
                sortedItems = items.sorted {
                    $0.creationTime > $1.creationTime
                }
            case .title:
                sortedItems = items.sorted {
                    if $0.title != $1.title {
                        return $0.title < $1.title
                    } else {
                        return $0.dueTime < $1.dueTime
                    }
                }
            case .dueTime:
                sortedItems = items.sorted {
                    $0.dueTime < $1.dueTime
                }
            case .completed:
                sortedItems = items.sorted {
                    if $0.isDone != $1.isDone {
                        return !$0.isDone && $1.isDone
                    } else {
                        return $0.dueTime < $1.dueTime
                    }
                }
        }
        return sortedItems
    }

}
