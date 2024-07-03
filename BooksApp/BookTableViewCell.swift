//
//  BookTableViewCell.swift
//  BooksApp
//
//  Created by Anna on 03.07.2024.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var coverView: UIImageView!
    @IBOutlet weak var authorView: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameView.text = nil
        authorView.text = nil
    }

    func config(book: Book) {
        nameView.text = book.bookName
        authorView.text = book.author
        
    }

}
