import Foundation
import UIKit


class LikedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        nameLabel.text = nil
        authorLabel.text = nil
    }
    
    func configure(with book: Book) {
        coverImageView.image = book.image
        nameLabel.text = book.name
        authorLabel.text = book.author
    }
}
