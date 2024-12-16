//
//  AddBookView.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    @State private var releaseDate: Date =  Date()
    @State private var selectedAuthor: Author?
    
    @Query private var authors: [Author]
    
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                DatePicker("Release Date", selection: $releaseDate, displayedComponents: .date)
                Picker("Author", selection: $selectedAuthor) {
                    Text("Select Author").tag(nil as Author?)
                    ForEach(authors) { author in
                        Text(author.name).tag(author as Author)
                    }
                }.toolbar {
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save"){
                            let book = Book(title: title, releaseDate: releaseDate, author: selectedAuthor!)
                            modelContext.insert(book)
                            
                            dismiss()
                        }.disabled(title.isEmpty || selectedAuthor == nil )
                    }
                    
                    ToolbarItem(placement: .cancellationAction){
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
              
            }
        }
    }
}

#Preview {
    AddBookView()
}
