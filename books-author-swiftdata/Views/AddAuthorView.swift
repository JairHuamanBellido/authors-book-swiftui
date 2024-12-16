//
//  AddAuthorView.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import SwiftUI
import SwiftData

struct AddAuthorView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
            }.toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let author = Author(name: name)
                        modelContext.insert(author)
                        
                        dismiss()
                    }.disabled(name.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddAuthorView()
}
