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
    
    func sort(tasks: [_Task]) -> [_Task] {
        var sortedTasks: [_Task] = []
        switch self {
            case .created:
                sortedTasks = tasks.sorted {
                    $0.creationTime > $1.creationTime
                }
            case .title:
                sortedTasks = tasks.sorted {
                    if $0.title != $1.title {
                        return $0.title < $1.title
                    } else {
                        return $0.dueTime < $1.dueTime
                    }
                }
            case .dueTime:
                sortedTasks = tasks.sorted {
                    $0.dueTime < $1.dueTime
                }
            case .completed:
                sortedTasks = tasks.sorted {
                    if $0.isDone != $1.isDone {
                        return !$0.isDone && $1.isDone
                    } else {
                        return $0.dueTime < $1.dueTime
                    }
                }
        }
        return sortedTasks
    }

}
