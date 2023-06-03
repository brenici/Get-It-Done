//
//  NewItemView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()

    var body: some View {
        VStack (spacing: 0) {
            Text("New Item")
                .font(.system(size: 18))
                .bold()
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date and Time", selection: $viewModel.dueTime)
                    .datePickerStyle(.graphical)
            }
        }
    }

}

struct NewItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewItemView()
    }
    
}
