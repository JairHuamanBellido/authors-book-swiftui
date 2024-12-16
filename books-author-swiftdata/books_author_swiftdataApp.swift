//
//  books_author_swiftdataApp.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import SwiftData
import SwiftUI

@main
struct books_author_swiftdataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Author.self, Book.self])
        }
    }
}
