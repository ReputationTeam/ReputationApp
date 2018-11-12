//
//  WelcomeViewController.swift
//  ReputationApp
//
//  Created by Panda on 11/11/18.
//  Copyright © 2018 ReputationApp. All rights reserved.
//

import UIKit
import paper_onboarding

class WelcomeViewController: UIViewController, PaperOnboardingDataSource {
    func onboardingItemsCount() -> Int {
        return 2
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let itemInfo: [OnboardingItemInfo] = [
            OnboardingItemInfo(informationImage: UIImage(named: "panda")!,
                               title: "Welcome to Reputation",
                               description: "Reputation ranks you based on your social media profiles.",
                               pageIcon: UIImage(named: "arrow")!,
                               color: UIColor.white,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 26, weight: UIFont.Weight.bold),
                               descriptionFont: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)),
            
            OnboardingItemInfo(informationImage: UIImage(named: "panda")!,
                               title: "Data Collection",
                               description: "In order for us to help you, we need you to login to Facebook.",
                               pageIcon: UIImage(named: "arrow")!,
                               color: UIColor.white,
                               titleColor: UIColor.black,
                               descriptionColor: UIColor.black,
                               titleFont: UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold),
                               descriptionFont: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)),
        ]
        
        return itemInfo[index]
    }
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "login")
        self.present(loginViewController!, animated: true, completion: nil)
    }
}
