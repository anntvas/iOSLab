//
//  LibraryViewController.swift
//  BooksApp
//
//  Created by Anna on 03.07.2024.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = BooksManager.shared.getBooks()
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        guard
            let tabBarController = self.tabBarController as? MainTabController else { return }
        self.user = tabBarController.user
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showBookInfo",
            let tabBarController = segue.destination as? BookViewController, let book = sender as? Book else { return }
        tabBarController.book = book
        tabBarController.user = user
    }
    
    
}

extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell()}
        cell.configure(with: dataSource[indexPath.row], user: self.user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = dataSource[indexPath.row]
        performSegue(withIdentifier: "showDetailedInfoBook", sender: book)
    }

}
