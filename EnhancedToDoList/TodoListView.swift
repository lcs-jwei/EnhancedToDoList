//
//  TodoListView.swift
//  EnhancedToDoList
//
//  Created by Justin Zack Wei on 2024-01-19.
//

import SwiftUI

struct TodoListView: View {
    
    // MARK: Stored properties
    @State private var newItemDetails = ""
    // Our list of items to complete
    @State private var items: [TodoItem] = []
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    
                    TextField("Enter a to-do item", text: $newItemDetails)
                    
                    Button("Add") {
                        addItem()
                    }

                }
                .padding(20)
                if items.isEmpty {
                    
                    ContentUnavailableView(label: {
                        Label(
                            "Nothing to do",
                            systemImage: "powersleep"
                        )
                        .foregroundStyle(.green)
                    }, description: {
                        Text("To-do items will appear here once you add some.")
                    })
                    
                } else {
                    List{
                        ForEach(items) { currentItem in
                            Label {
                                Text(currentItem.details)
                            } icon: {
                                Image(systemName: currentItem.isCompleted ? "checkmark.circle" : "circle")
                                    .onTapGesture {
                                        toggle(item: currentItem)
                                    }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Tasks")
        }
        .onAppear {
            // Populate with example data
            if items.isEmpty {
                items.append(contentsOf: exampleData)
            }
        }
    }
    // MARK: Functions
    func addItem() {
        let newToDoItem = TodoItem(details: newItemDetails)
        items.insert(newToDoItem, at: 0)
        newItemDetails = ""
    }
    func toggle(item: TodoItem) {
        if item.isCompleted {
            item.completedOn = nil
            item.isCompleted = false
        } else {
            item.completedOn = Date()
            item.isCompleted = true
        }
        
    }
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}

#Preview {
    LandingView()
}
