//
//  HomeView.swift
//  ToDoApp-CWK-Ref
//
//  Created by Abishan Parameswaran on 2023-03-12.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: ListViewModel
    
    @State private var selectedIndex = 0
    @State private var isSheetShowing = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    ForEach(viewModel.todoList){ list in
                        VStack(alignment: .leading){
                            Text("\(list.title ?? "")")
                            Text("\(list.listDescriptions ?? "")")
                            
                            if list.priority == String(0){
                                Text("Low")
                                    .foregroundColor(Color.yellow)
                            }
                            
                            if list.priority == String(1){
                                Text("Medium")
                                    .foregroundColor(Color.green)
                            }
                            
                            if list.priority == String(2){
                                Text("High")
                                    .foregroundColor(Color.red)
                            }
                            
                        }
                    }
                    .onDelete(perform: viewModel.deleteList)
                }
                
                .toolbar {
                    ToolbarItem {
                        Button {
                            isSheetShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isSheetShowing) {
                    AddNewListView(viewModel: viewModel)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ListViewModel())
    }
}
