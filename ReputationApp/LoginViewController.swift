//
//  LoginViewController.swift
//  ReputationApp
//
//  Created by Panda on 11/11/18.
//  Copyright © 2018 ReputationApp. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func facebookLoginTapped(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [.publicProfile, .userFriends], viewController: self) { (result) in
            switch result {
            case .failed(let error):
                print(error.localizedDescription)
            case .cancelled:
                print("The user has cancelled this operation.")
            case .success(grantedPermissions: let granted, declinedPermissions: let declined, token: let accessToken):
                print("Logged In")
            }
        }
    }
}
