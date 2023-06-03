//
//  NewItemView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var isNewItemPresented: Bool

    var body: some View {
        VStack (spacing: 0) {
            Text("New Item")
                .font(.title3)
                .bold()
            Form {
                Section (
                    header: ErrorMessageView(errorMessage: $viewModel.errorMessage)
                ) {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date and Time", selection: $viewModel.dueTime)
                        .datePickerStyle(.graphical)
                }
            }
            Button {
                if viewModel.validate() {
                    viewModel.saveNewItem()
                    isNewItemPresented = false
                }
            } label: {
                Text("Save")
            }
        }
    }

}

struct NewItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewItemView(isNewItemPresented: Binding(get: {
            return true
        }, set: { _ in
            //
        }))
    }
    
}
