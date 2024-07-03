//
//  LibraryViewController.swift
//  BooksApp
//
//  Created by Anna on 02.07.2024.
//

import UIKit
class Book {
    var bookName: String
    var author: String
    var cover: UIImage
    var isAdded: Bool
    init(bookName: String, author: String, cover: UIImage, isAdded: Bool) {
        self.bookName = bookName
        self.author = author
        self.cover = cover
        self.isAdded = isAdded
    }
}

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSourse: [Book] = [Book(bookName:"Противостояние", author: "Стивен Кинг", cover: .elonmusk, isAdded: false), Book(bookName: "Великий Гэтсби", author: "Фрэнсиси Скотт Фицдджеральд", cover: .pfp, isAdded: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension LibraryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as? BookTableViewCell else { return UITableViewCell() }
        cell.config(book: dataSourse[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goFirst", sender: nil)
    }
    
}
