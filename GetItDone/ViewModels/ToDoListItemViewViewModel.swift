//
//  ToDoListItemViewViewModel.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import Foundation

final class ToDoListItemViewViewModel: ObservableObject {
    
    public func toggleIsDone(for item: ToDoItem) {
        print("Item \(item.id) done is toggled...")
        // update item
    }

}
