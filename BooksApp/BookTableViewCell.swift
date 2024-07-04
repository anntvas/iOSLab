import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var authorView: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    private var book: Book?
    private var user: User?
    private let favouritesData = FavouritesData.shared
    
    override func awakeFromNib() {
            super.awakeFromNib()
            NotificationCenter.default.addObserver(self, selector: #selector(handleLikedBooksUpdated), name: .likedBooksUpdated, object: nil)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverView.image = nil
        nameView.text = nil
        authorView.text = nil
        likeButton.removeTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    func configure(with book: Book, user: User?) {
        self.user = user
        self.book = book
        coverView.image = book.image
        nameView.text = book.name
        authorView.text = book.author
        configureButton(book: book, user: user)
    }
    
    func configureButton(book: Book, user: User?) {
        if let user = user, favouritesData.isBookLiked(user: user, book: book) {
            likeButton.tintColor = .red
        } else {
            likeButton.tintColor = .gray
        }
    }
        
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        guard let book = book, let user = user else { return }
        if favouritesData.isBookLiked(user: user, book: book) {
            likeButton.tintColor = .gray
            favouritesData.removeLikedBook(user: user, book: book)
        } else {
            favouritesData.addLikedBook(user: user, book: book)
            likeButton.tintColor = .red
        }
        NotificationCenter.default.post(name: .likedBooksUpdated, object: nil)
    }
    
    @objc func handleLikedBooksUpdated() {
            guard let book = book, let user = user else { return }
            configureButton(book: book, user: user)
        }
}
