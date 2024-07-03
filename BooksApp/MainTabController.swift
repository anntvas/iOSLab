//
//  MainTabController.swift
//  BooksApp
//
//  Created by Anna on 03.07.2024.
//

import UIKit

class MainTabController: UITabBarController {
    
    var user: User?
    var profileVC: ProfileViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileVC = self.viewControllers![0] as? ProfileViewController
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
            
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
