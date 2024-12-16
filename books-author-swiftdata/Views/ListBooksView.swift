import SwiftData
//
//  ListBooksView.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//
import SwiftUI

struct ListBooksView: View {

    @Query private var books: [Book]
    @State private var isShowSheet: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    VStack(alignment: .leading) {

                        Text(book.title).font(.headline)

                        Text("Author: \(book.author.name)").font(.subheadline).foregroundStyle(.secondary)

                    }.listRowBackground(Color.clear).listRowInsets(
                        .init(top: 12, leading: 0, bottom: 12, trailing: 0))

                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowSheet.toggle()
                    }) {
                        Label("Add Book", systemImage: "plus")
                    }.sheet(isPresented: $isShowSheet) {
                        AddBookView()
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Books")
        }
    }
}

#Preview {
    ListBooksView()
}
