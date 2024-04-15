//
//  TodoListView.swift
//  TODOVision
//
//  Created by Lovice Sunuwar on 08/04/2024.
//

import SwiftUI
import SwiftData


struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @State var list: TodoList
    
    @State private var showAddTodoAlert: Bool = false
    @State private var newTodoTitle: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Todo")) {
                ForEach(list.items.filter { !$0.isDone }) { item in
                    HStack {
                        Button {
                            item.isDone.toggle()
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
            
            Section(header: Text("Completed")) {
                ForEach(list.items.filter { $0.isDone }) { item in
                    HStack {
                        Button {
                            item.isDone.toggle()
                        } label: {
                            Image(systemName: item.isDone ? "checkmark.circle.fill" : "checkmark.circle")
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Details for \(list.title)")
        .toolbar {
            Button("Add Todo") {
                showAddTodoAlert.toggle()
            }
        }
        .alert("Add Task", isPresented: $showAddTodoAlert) {
            TextField("Todo Title", text: $newTodoTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
                let todo = TodoItem(title: newTodoTitle)
                modelContext.insert(todo)
                list.items.append(todo)
            }
        }
        .id(list.id)
    }
}
