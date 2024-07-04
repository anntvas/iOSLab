import UIKit

class  ProfileViewController: UIViewController {
    
    @IBOutlet weak var nameView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var mailView: UILabel!
    @IBOutlet weak var bioView: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tabBarController = self.tabBarController as? MainTabController else { return }
        let user = tabBarController.user
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
