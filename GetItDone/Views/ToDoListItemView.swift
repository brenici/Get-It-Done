//
//  ToDoListItemView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct ToDoListItemView: View {

    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDoItem
    
    var body: some View {
        HStack(spacing: 16) {
            Button{
                viewModel.toggleIsDone(for: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title3)
                Text(
                    Date(timeIntervalSince1970: item.dueTime).formatted(
                        date: .abbreviated,
                        time: .shortened
                    )
                )
                .foregroundColor(Color(.secondaryLabel))
            }
        }
    }
    
}

struct ToDoListItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        ToDoListItemView(
            item: .init(
                id: "1234567890",
                title: "A new item",
                dueTime: 1687122433,
                creationTime: 1686122893.333,
                isDone: false
            )
        )
    }
    
}
