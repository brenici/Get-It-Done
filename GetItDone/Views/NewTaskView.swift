//
//  NewTaskView.swift
//  GetItDone
//
//  Created by Emilian Brenici on 03/06/2023.
//

import SwiftUI

struct NewTaskView: View {
    
    @StateObject var viewModel = NewTaskViewModel()
    @Binding var isNewTaskViewPresented: Bool

    var body: some View {
        VStack(spacing: 0) {
            Text("New Task")
                .font(.title3)
                .bold()
                .padding(.top, 20)
            Form {
                Section (
                    header: ErrorMessageView(errorMessage: $viewModel.errorMessage)
                ) {
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date and Time", selection: $viewModel.dueTime)
                        .datePickerStyle(.graphical)
                    ButtonView(
                        title: "Save",
                        tint: .green
                    ) {
                        if viewModel.validate() {
                            viewModel.saveNewTask()
                            isNewTaskViewPresented = false
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
        Spacer()
    }

}

struct NewTaskView_Previews: PreviewProvider {
    
    static var previews: some View {
        NewTaskView(isNewTaskViewPresented: Binding(get: {
            return true
        }, set: { _ in
            //
        }))
    }
    
}
