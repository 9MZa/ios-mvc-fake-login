//
//  Home.swift
//  ios-mvc
//
//  Created by Bandit Silachai on 10/11/23.
//

import UIKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = .systemFont(ofSize: 32, weight: .medium)
        
        return label
    }()
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
