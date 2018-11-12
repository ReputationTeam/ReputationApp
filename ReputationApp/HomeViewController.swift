//
//  HomeViewController.swift
//  ReputationApp
//
//  Created by Panda on 11/11/18.
//  Copyright © 2018 ReputationApp. All rights reserved.
//

import UIKit
import FacebookCore

class HomeViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    var followers: Double = 0
    
    override func viewWillAppear(_ animated: Bool) {
        let graphPath = "me/friends"
        let parameters = ["fields": ""]
        
        let graphRequest = GraphRequest(graphPath: graphPath, parameters: parameters, accessToken: AccessToken.current, httpMethod: GraphRequestHTTPMethod.GET, apiVersion: GraphAPIVersion.defaultVersion)
        
        graphRequest.start { (httpResponse, result) in
            switch result {
            case .success(let response):
                let summary = response.dictionaryValue!["summary"] as! [String: Int]
                let totalFriends = summary["total_count"]
                
                self.followers += Double(totalFriends!)
                self.followers = self.followers * 0.05
                self.scoreLabel.text = "Your Score: \(self.followers)"
                
                if self.followers >= 1500 {
                    self.commentLabel.text = "You're pretty popular! 🙃"
                } else if self.followers < 1500 && self.followers > 500 {
                    self.commentLabel.text = "This is pretty average 🙂"
                } else {
                    self.commentLabel.text = "Time to boost those numbers! 👍"
                }
                break
            case .failed(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
