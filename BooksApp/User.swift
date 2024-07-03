//
//  User.swift
//  BooksApp
//
//  Created by Anna on 02.07.2024.
//

import Foundation
import UIKit
class User {
    var login: String
    var password: String
    var fullName: String
    var birthDate: String
    var contactInfo: String
    var bio: String
    var profilePic: UIImage
    
    init(login: String, password: String, fullName: String, birthDate: String, contactInfo: String, bio: String, profilePic: UIImage) {
        self.login = login
        self.password = password
        self.fullName = fullName
        self.birthDate = birthDate
        self.contactInfo = contactInfo
        self.bio = bio
        self.profilePic = profilePic
    }
}
