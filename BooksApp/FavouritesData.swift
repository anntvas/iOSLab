import Foundation

class FavouritesData {
    static let shared = FavouritesData()
    private let userDefaultsKey = "likedBooksByUser"
    private var likedBooksByUser = [String:[Book]]()
    
    private init() {
        loadLikedBooks()
    }
    
    func getLikedBooks(user: User) -> [Book] {
        return likedBooksByUser[user.login] ?? []
    }
    
    func addLikedBook(user: User, book: Book) {
        if likedBooksByUser[user.login] == nil {
            likedBooksByUser[user.login] = [book]
        }
        if !likedBooksByUser[user.login]!.contains(book) {
            likedBooksByUser[user.login]?.append(book)
            saveLikedBooks()
        }
    }
    
    func isBookLiked(user: User, book: Book) -> Bool {
        return likedBooksByUser[user.login]?.contains(book) ?? false
    }
    
    func removeLikedBook(user: User, book: Book) {
        guard var likedBooks = likedBooksByUser[user.login] else { return }
        guard let index = likedBooks.firstIndex(of: book) else { return }
        likedBooks.remove(at: index)
        likedBooksByUser[user.login] = likedBooks
        saveLikedBooks()
    }
    
    private func saveLikedBooks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(likedBooksByUser) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadLikedBooks() {
        guard let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) else { return }
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([String: [Book]].self, from: savedData) else { return }
        likedBooksByUser = decoded
    }
}
