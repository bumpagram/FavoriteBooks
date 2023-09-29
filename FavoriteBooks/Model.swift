import Foundation

struct Book: CustomStringConvertible {
    let title: String
    let author: String
    let genre: String
    let length: String
    
    var description: String {
        return "\(title) is written by \(author) in the \(genre) genre and is \(length) pages long"
    }
}





var ArrayAllBooks: [Book] = [
    
    Book(title: "Harry Potter", author: "Joan Rolling", genre: "fantastic", length: "355")

]

