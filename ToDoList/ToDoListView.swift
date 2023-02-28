//
//  ContentView.swift
//  ToDoList
//
//  Created by Caitlin Price on 2/27/23.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swift", "Build Apps", "Change the World", "Bring the awesome", "Take a vacation"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) {
                    toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                    
                }
                
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            
            //        VStack {
            //            NavigationLink {
            //                DetailView()
            //            } label: {
            //                Image(systemName: "eye")
            //                Text("Show the new view!")
            //            }
            //            .buttonStyle(.borderedProminent)
            //
            //        }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView()
        }
    }
    
}
