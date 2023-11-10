//
//  LoginView.swift
//  ios-mvc
//
//  Created by Bandit Silachai on 10/11/23.
//

import UIKit
import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var emailField: UITextField = {
        let field = UITextField();
        field.layer.borderWidth = 0.5
        field.layer.cornerRadius = 6
        field.placeholder = "Email"
        field.keyboardType = .emailAddress
        field.autocapitalizationType = .none
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0,
                width: 10, height: field.frame.size.height))
        field.leftView = paddingView
        field.leftViewMode = .always
        
        return field
    }()
    
    lazy var passwordField: UITextField = {
        let field = UITextField()
        field.layer.borderWidth = 0.5
        field.layer.cornerRadius = 6
        field.placeholder = "Password"
        field.keyboardType = .default
        field.isSecureTextEntry = true
        field.autocapitalizationType = .none

        let paddingView = UIView(frame: CGRect(x: 0, y: 0,
                width: 10, height: field.frame.size.height))
        field.leftView = paddingView
        field.leftViewMode = .always
        
        return field
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.alpha = 0.6
        button.layer.cornerRadius = 6
        button.isEnabled = false
        
        return button
    }()
    
    
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(loginButton)
        addSubview(emailField)
        addSubview(passwordField)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        
        emailField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailField.bottomAnchor.constraint(equalTo: passwordField.topAnchor,constant: -15).isActive = true
        
        passwordField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
