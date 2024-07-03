//
//  LikedCollectionViewCell.swift
//  BooksApp
//
//  Created by Anna on 03.07.2024.
//

import Foundation
import UIKit


class LikedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
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
