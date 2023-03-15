//
//  ListViewModel.swift
//  ToDoApp-CWK-Ref
//
//  Created by Abishan Parameswaran on 2023-03-12.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject{
    
    
    @Published var todoList: [ToDoListEntity] = []
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "ListDataContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error in loading core data. \(error)")
            } else {
                print("Successfully loaded core data.")
            }
        }
        fetchData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<ToDoListEntity>(entityName: "ToDoListEntity")
        do {
            todoList = try container.viewContext.fetch(request)
        } catch let error {
            print("Error in fetching data. \(error)")
        }
    }
    
    func addListData(title: String, listDescriptions: String, priority: String) {
        let newTodoItem = ToDoListEntity(context: container.viewContext)
        newTodoItem.title = title
        newTodoItem.listDescriptions = listDescriptions
        newTodoItem.priority = priority
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error while saving data. \(error)")
        }
    }
    
    func filterWithPriority(priority: String) -> [ToDoListEntity] {
        return todoList.filter { $0.priority == priority }
    }
    
//    func filterFavouritePizzas() -> [ToDoListEntity] {
//        return savedPizzaData.filter { $0.isFavourite == true }
//    }
    
//    func updatePriority(entity: ToDoListEntity, isFavourite: Bool) {
//        entity.isFavourite = isFavourite
//        saveData()
//    }
    
    func deleteList(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let listEntity = todoList[index]
        container.viewContext.delete(listEntity)
        saveData()
    }

}
