import UIKit

class BookViewController: UIViewController {
 
    @IBOutlet weak var bookCoverView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    private let likedBooks = FavouritesData.shared
    var user: User?
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        config()
    }
    
    func config() {
        authorLabel.text = book?.author
        nameLabel.text = book?.name
        bookCoverView.image = book?.image
        bioLabel.text = book?.bio
        if let user = user, likedBooks.isBookLiked(user: user, book: book!) {
            likeButton.setTitle("В избранном", for: .normal)
        } else {
            likeButton.setTitle("Добавить в избранное", for: .normal)
        }
    }

    @IBAction func toLikedButtonTapped(_ sender: Any) {
        guard let user = user, let book = book else { return }
        if likedBooks.isBookLiked(user: user, book: book) {
            likedBooks.removeLikedBook(user: user, book: book)
            likeButton.setTitle("Добавить в избранное", for: .normal)

        } else {
            likedBooks.addLikedBook(user: user, book: book)
            likeButton.setTitle("В избранном", for: .normal)
        }
        NotificationCenter.default.post(name: .likedBooksUpdated, object: nil)
    }
}
