//
//  NetworkService.swift
//  ios-mvc
//
//  Created by Bandit Silachai on 10/11/23.
//

import Foundation

class NetworkService {
    static let share = NetworkService()
    init() { }
    
    private var user: User?
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void ) {
        
        DispatchQueue.global().async {
            sleep(1)
            DispatchQueue.main.async {
                if email == "john@doe.com" && password == "john" {
                    self.user = User(firstName: "John", lastname: "Doe", email: email)
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
    
    func getUser() -> User {
        guard let user = user else {
            return User(firstName: "", lastname: "", email: "")
        }
        
        return user
    }
}
