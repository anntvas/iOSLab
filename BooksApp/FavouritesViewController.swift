import UIKit

class FavouritesViewController: UIViewController {
    @IBOutlet weak var likedBooksCollection: UICollectionView!
    var user: User?
    var dataSource: UICollectionViewDiffableDataSource<Int, Book>!
    private let favouritesData = FavouritesData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        guard
            let tabBarController = self.tabBarController as? MainTabController,
            let user = tabBarController.user else { return }
        self.user = user
        updateDataSource()
        NotificationCenter.default.addObserver(self, selector: #selector(updateDataSource), name: .likedBooksUpdated, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .likedBooksUpdated, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateDataSource()
    }
    
    @objc func updateDataSource() {
            guard let user = user else { return }
            let likedBooks = favouritesData.getLikedBooks(user: user)
            var snapshot = NSDiffableDataSourceSnapshot<Int, Book>()
            snapshot.appendSections([0])
            snapshot.appendItems(likedBooks)
            dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func configureCollectionView() {
            likedBooksCollection.collectionViewLayout = UICollectionViewFlowLayout()
            dataSource = UICollectionViewDiffableDataSource<Int, Book>(collectionView: likedBooksCollection) { collectionView, indexPath, book in
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikedCollectionViewCell", for: indexPath) as? LikedCollectionViewCell else { return nil }
                cell.configure(with: book)
                return cell
            }
            likedBooksCollection.dataSource = dataSource
            likedBooksCollection.delegate = self
        }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 360, height: 160)
    }
}

extension Notification.Name {
    static let likedBooksUpdated = Notification.Name("likedBooksUpdated")
}
