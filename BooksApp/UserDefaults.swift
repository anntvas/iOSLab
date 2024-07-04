import Foundation
import UIKit

extension UserDefaults {
    
    func setBooks(_ books: [Book], forKey key: String) {
        setValue(books.compactMap({ book in book.id }), forKey: key)
    }
    
    func getBooks(forKey key: String) -> [Book] {
        guard let books = array(forKey: key) as? [Book.ID] else { return [] }
        return books.compactMap { id in BooksManager.shared.getBook(by: id) }
    }
}
