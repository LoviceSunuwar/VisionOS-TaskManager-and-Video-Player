//
//  TODOVisionApp.swift
//  TODOVision
//
//  Created by Lovice Sunuwar on 08/04/2024.
//

import SwiftUI
import SwiftData

@main
struct TODOVisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoList.self)
    }
}
