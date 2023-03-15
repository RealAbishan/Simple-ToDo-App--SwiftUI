//
//  SortListView.swift
//  ToDoApp-CWK-Ref
//
//  Created by Abishan Parameswaran on 2023-03-12.
//

import SwiftUI

struct SortListView: View {
    
    @State private var selectedIndex = 0
    @ObservedObject var viewModel: ListViewModel

    var body: some View {
        NavigationStack{
            VStack{
                Picker("Pizza", selection: $selectedIndex) {
                    Text("Low").tag(0)
                    Text("Medium").tag(1)
                    Text("High").tag(2)
                }
                .pickerStyle(.segmented)
                
                List{
                    
                    if selectedIndex == 0 {
                        
                        ForEach(viewModel.todoList){ list in
                            if list.priority == String(0){
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(list.title ?? "")")
                                    Text("\(list.listDescriptions ?? "")")
                                    Text("Low")
                                        .foregroundColor(Color.green)
                                }
                            }
                        }
                    }
                    
                    
                    else if selectedIndex == 1 {
                        
                        ForEach(viewModel.todoList){ list in
                            if list.priority == String(1){
                                VStack(alignment: .leading, spacing: 0) {
                                    Text("\(list.title ?? "")")
                                    Text("\(list.listDescriptions ?? "")")
                                    Text("Medium")
                                        .foregroundColor(Color.yellow)
                                }
                            }
                        }
                    }
                    
                    else {
                        
                        ForEach(viewModel.todoList){ list in
                                if list.priority == String(2){
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text("\(list.title ?? "")")
                                        Text("\(list.listDescriptions ?? "")")
                                        Text("High")
                                            .foregroundColor(Color.red)
                                    }
                                }
                        }
                        .onDelete(perform: viewModel.deleteList)
                        .listStyle(.plain)
                    }
                    
                    
                }
            }
            
            
        }
        .padding()
    }
}

struct SortListView_Previews: PreviewProvider {
    static var previews: some View {
        SortListView(viewModel: ListViewModel())
    }
}
