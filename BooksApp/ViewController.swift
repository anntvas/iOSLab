//
//  ViewController.swift
//  BooksApp
//
//  Created by Anna on 02.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    
    
    private var users = [User(login: "ivanov", password: "ivan123", fullName: "Иванов Иван Иванович", birthDate: "20.02.1963", contactInfo: "ivan12345@mail.ru", bio: "Ценю честность, прямоту и душевные разговоры. В свободное время люблю сходить на рыбалку и смотреть футбол.", profilePic: .pfp),
                         User(login: "elonmusk", password: "spacex-success", fullName: "Elon Musk", birthDate: "28.06.1971", contactInfo: "elonmusk@x.com", bio: "The CEO and co-founder of SpaceX, Tesla, Neuralink and The Boring Company", profilePic: .elonmusk)]
    
    func LogInUser(login: String, pass: String) -> User? {
        return users.first(where: { $0.login == login && $0.password == pass })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enterProfile" {
            if let profileVC = segue.destination as? MainTabController, let user = sender as? User {
                profileVC.user = user
            }
        }
    }
    
    
    @IBAction func signInButtonSmashed(_ sender: Any) {
        guard let login = loginTextField.text, let password = passwordTextField.text else { return }
                
        if let user = LogInUser(login: login, pass: password) {
            loginTextField.text = ""
            passwordTextField.text = ""
            performSegue(withIdentifier: "enterProfile", sender: user)
        } else {
            let alert = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

}

