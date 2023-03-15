//
//  AddNewListView.swift
//  ToDoApp-CWK-Ref
//
//  Created by Abishan Parameswaran on 2023-03-12.
//

import SwiftUI

struct AddNewListView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    @State private var title = ""
    @State private var description = ""
    @State private var priority = ""
    @State private var selectedIndex = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $title)
                } header: {
                    Text("Title Name")
                }
                
                Section {
                    TextEditor(text: $description)
                        .frame(height: 200)
                } header: {
                    Text("Short Description")
                }
                
                Section{
                    Picker("Pizza", selection: $selectedIndex) {
                        Text("Low").tag(0)
                        Text("Medium").tag(1)
                        Text("High").tag(2)
                    }
                    .pickerStyle(.wheel)
                    
                    }
                header:{
                    Text("Priority")
                }
                
            }
            .navigationTitle("Add New ToDo")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        viewModel.addListData(title: title, listDescriptions: description, priority: String(selectedIndex))
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewListView(viewModel: ListViewModel())
    }
}
