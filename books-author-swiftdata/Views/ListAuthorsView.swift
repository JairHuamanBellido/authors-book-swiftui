//
//  ListAuthorsView.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import SwiftData
import SwiftUI

struct ListAuthorsView: View {

    @Query private var authors: [Author]
    @State private var isShowSheet: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(authors) { author in
                    Text(author.name)
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowSheet.toggle()
                    }) {
                        Text("Add")
                    }.sheet(isPresented: $isShowSheet){
                        AddAuthorView()
                    }
                }
            }.navigationTitle("Authors")
        }
    }
}

#Preview {
    ListAuthorsView()
}
