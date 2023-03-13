//
//  ToDosViewModel.swift
//  ToDoList
//
//  Created by Caitlin Price on 3/12/23.
//

import Foundation


class ToDosViewModel: ObservableObject {
    
    @Published var toDos: [ToDo] = []
    
    init() {
   // uncomment purgeData() to delete all to dos
   //     purgeData()
        loadData()
    }
    
    func toggleCompleted(toDo: ToDo) {
        guard toDo.id != nil else {return}
        var newToDo = toDo
            newToDo.isCompleted.toggle() // flips false to true and true to false
        
        // find ID for newToDo in array of toDos, then update element at that index with newtodo data
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id}) {
           toDos[index] = newToDo
        }
        saveData()
        
    }
    
    
    
    
    
    func saveToDo(toDo: ToDo) {
        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString
            toDos.append(newToDo)

        } else {
            if let index = toDos.firstIndex(where: {$0.id == toDo.id}) {
               toDos[index] = toDo
            }
        }
        saveData()
    }
    
    func deleteToDo(indexSet: IndexSet) {
       toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo(fromOffsets: IndexSet, toOffset: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else {return}
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
            
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos) // try means if error is thrown, data = nil
        do {
            try data?.write(to: path)
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
    
    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
        do {
            try data?.write(to: path)
            
        } catch {
            print("😡 ERROR: Could not save data \(error.localizedDescription)")
        }
    }
}
