//
//  ProfileViewController.swift
//  BooksApp
//
//  Created by Anna on 02.07.2024.
//

import UIKit

class  ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var mailView: UILabel!
    @IBOutlet weak var bioView: UILabel!
    @IBOutlet weak var button: UIButton!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureInfoViewContoller()
    }
    func configureInfoViewContoller() {
        imageView.image = user?.profilePic
        nameView.text = user?.fullName
        dateView.text = user?.birthDate
        mailView.text = user?.contactInfo
        bioView.text = user?.bio
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
