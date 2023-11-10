//
//  HomeViewController.swift
//  ios-mvc
//
//  Created by Bandit Silachai on 10/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        user = NetworkService.share.getUser()
        greetingUser()
        view.addSubview(homeView)
        
        homeView.translatesAutoresizingMaskIntoConstraints = false
        homeView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        homeView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    private func greetingUser() {
        homeView.welcomeLabel.text = "👋 \(user.firstName) \(user.lastname)"
    }
}
