//
//  ViewController.swift
//  ios-mvc
//
//  Created by Bandit Silachai on 10/11/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(loginView)
        setupUI()
        loginView.emailField.delegate = self
        loginView.passwordField.delegate = self
        
        loginView.emailField.addTarget(self, action: #selector(validateField), for: .editingChanged)
        loginView.passwordField.addTarget(self, action: #selector(validateField), for: .editingChanged)
        
       
    }
    
    func setupUI() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        loginView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView.emailField {
            loginView.passwordField.becomeFirstResponder()
        } else if textField == loginView.passwordField {
            performLogin()
        }
        
        return true
    }
    
    @objc func loginButtonTapped() {
        performLogin()
    }
    
    @objc private func validateField() {
        loginView.loginButton.isEnabled = loginView.emailField.text != "" && loginView.passwordField.text != ""
        
        if loginView.loginButton.isEnabled {
            loginView.loginButton.alpha = 1
            loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        } else {
            loginView.loginButton.alpha = 0.5
        }
    }
    
    func performLogin() {
        let email = loginView.emailField.text ?? ""
        let password = loginView.passwordField.text ?? ""
        print("logging...")

        
        let homeVC = HomeViewController()
        
        NetworkService.share.login(email: email, password: password) { success in
            if success {
                self.present(homeVC, animated: true)
                self.loginView.emailField.text = ""
                self.loginView.passwordField.text = ""
            } else {
                let alertController = UIAlertController(title: "เข้าไม่ได้อ่ะ", message: "แน่ใจนะว่า Email กับ Password ถูก ?", preferredStyle: .alert)
                let tryAction = UIAlertAction(title: "ลองใหม่", style: .default) { (action) in
                    print(action.title!)
                }
                alertController.addAction(tryAction)
                self.present(alertController, animated: true)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

