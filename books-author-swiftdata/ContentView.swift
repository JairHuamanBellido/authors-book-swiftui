//
//  ContentView.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//



import SwiftUI
import SwiftData
struct ContentView: View {

    enum AppTabs {
        case books
        case authors
    }
    
    
    @State var selectedTab: AppTabs = .authors
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Authors", systemImage: "person", value: .authors) {
                ListAuthorsView()
            }
            Tab("Books", systemImage: "books.vertical", value: .books) {
                ListBooksView()
            }
           
        }
    }
}

#Preview {
    ContentView()
}
