//
//  Book.swift
//  books-author-swiftdata
//
//  Created by Jair Orlando Huaman Bellido on 15/12/24.
//

import Foundation
import SwiftData


@Model
final class Book {
    
    
    @Attribute(.unique)
    var id: UUID
    
    var title: String
    var releaseDate: Date
    var author: Author
    
    init(title: String, releaseDate: Date, author: Author){
        self.id = UUID()
        self.title = title
        self.releaseDate = releaseDate
        self.author = author
    }
    
    
}
