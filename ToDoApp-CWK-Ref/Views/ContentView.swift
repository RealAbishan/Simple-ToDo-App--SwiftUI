//
//  ContentView.swift
//  ToDoApp-CWK-Ref
//
//  Created by Abishan Parameswaran on 2023-03-12.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject var viewModel = ListViewModel()
    init() {
        UITabBar.appearance().barTintColor = .systemBackground
      }
    var body: some View {
        
        
        TabView{
            HomeView(viewModel: ListViewModel())
                .tabItem{
                    Label("ToDo's ✅", systemImage: "house")
                }
            
            SortListView(viewModel: ListViewModel())
                .tabItem{
                    Label("Sort", systemImage: "list.dash")
                }
        }
        .accentColor(Color.indigo)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
