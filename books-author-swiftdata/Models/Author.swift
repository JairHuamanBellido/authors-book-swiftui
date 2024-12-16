//
//  Author.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import Foundation
import SwiftData


@Model
final class Author {
    
    @Attribute(.unique)
    var id: UUID
    
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Book.author)
    var books: [Book]
    
    
    init(name:String){
        self.id = UUID()
        self.name = name
        self.books = []
    }
    
}
