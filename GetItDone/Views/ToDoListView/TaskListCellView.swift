//
//  TaskListCellView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct TaskListCellView: View {
    
    @StateObject var viewModel = TaskListCellViewModel()
    
    let task: _Task
    
    var body: some View {
        HStack(spacing: 16) {
            Button{
                viewModel.toggleIsDone(for: task)
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.system(size: 16))
                Text(
                    Date(timeIntervalSince1970: task.dueTime).formatted(
                        date: .abbreviated,
                        time: .shortened
                    )
                )
                    .font(.system(size: 15))
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
        }
    }
    
}

struct TaskListCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        TaskListCellView(
            task: .init(
                id: "1234567890",
                title: "A new task title",
                dueTime: 1687122433,
                creationTime: 1686122893.333,
                isDone: false
            )
        )
    }
    
}
