//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Caitlin Price on 2/27/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}
