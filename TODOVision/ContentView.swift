import SwiftUI
import AVKit
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todoLists: [TodoList] = []
    @State private var selectedTodoList: TodoList? = nil
    
    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""
    @State private var isVideoPlaying: Bool = false // Track video playing state
    
    var body: some View {
        NavigationSplitView(sidebar: {
            VStack {
                // Button to navigate to video player view
                NavigationLink(destination: VideoPlayerView(videoURL: URL(fileURLWithPath: "/Users/lovice/Downloads/y2mate.com - Toronto Cinematic Video丨 Love in Toronto_1080p.mp4"), isPlaying: $isVideoPlaying)) {
                    Text("Video Player")
                        .padding()
                }
                .buttonStyle(BorderlessButtonStyle())
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // List of todo lists
                
                List(todoLists) { list in
                    NavigationLink(destination: TodoListView(list: list)) { // NavigationLink to navigate to tasks view
                        Text(list.title)
                    }
                }
                .navigationTitle("Todo Lists")
                .toolbar {
                    Button("Add") {
                        showAddListAlert.toggle()
                    }
                }
                .alert("Add To do List", isPresented: $showAddListAlert) {
                    TextField("Todo List Title", text: $newListTitle)
                    Button("Cancel", role: .cancel, action: {})
                    Button("Create") {
                        let list = TodoList(title: newListTitle)
                        modelContext.insert(list)
                    }
                }
            }
        }, detail: {
            if let selectedTodoList = selectedTodoList {
                TodoListView(list: selectedTodoList)
            } else {
                EmptyView()
            }
        })
    }
}
