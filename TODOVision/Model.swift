//
//  Model.swift
//  TODOVision
//
//  Created by Lovice Sunuwar on 08/04/2024.
//

import Foundation
import SwiftData
// Using the swift data Model class, while previously using struct we provide UUID but, Model class in swiftdata gives out an id by itself, hence we dont have the use of it.

@Model
class TodoList {
    var title: String
    
    @Relationship(deleteRule: .cascade)
    var items: [TodoItem] = []
    
    init(title: String) {
        self.title = title
    }
}

@Model
class TodoItem {
    var title: String
    var isDone: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
