//
//  ToDo.swift
//  ToDoList
//
//  Created by Caitlin Price on 3/12/23.
//

import Foundation


struct ToDo: Identifiable, Codable {
    var id: String?
    
    
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
    
}
