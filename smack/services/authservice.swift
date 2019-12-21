//
//  authservice.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/20/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    private let REGISTER_URL = "\(API_URL)/account/register"
    private let LOGIN_URL    = "\(API_URL)/account/login"
    private let CREATE_USER_URL    = "\(API_URL)/user/add"
    
    let defaults = UserDefaults.standard
    
    var isLogged: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    let headers: HTTPHeaders = [
        "Content-Type": "application/json; charcter=utf-8"
    ]
    
    
    
    func registerUser(email: String, password: String, completion: @escaping completionHandler) {
        struct Register: Encodable {
            let email: String
            let password: String
        }
        let body: Register = Register(email: email.lowercased(), password: password)
        
        
        AF.request(REGISTER_URL,
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { (response) in
                    debugPrint(response)
                    if response.error == nil {
                        completion(true)
                    } else {
                        completion(false)
                    }
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping completionHandler) {
        struct Register: Encodable {
            let email: String
            let password: String
        }
        let body: Register = Register(email: email.lowercased(), password: password)
        
        
        AF.request(LOGIN_URL,
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).responseJSON(completionHandler: { (response) in
                    debugPrint(response)
                    if response.error == nil {
                        //                        switch response.result {
                        //                        case .success:
                        //                            print("Login User Success: \(String(describing: response.value))")
                        //                            if let json = response.value as? Dictionary<String, Any> {
                        //                                if let email = json["user"] as? String {
                        //                                    self.userEmail = email
                        //                                }
                        //
                        //                                if let token = json["token"] as? String {
                        //                                    self.userEmail = token
                        //                                }
                        
                        completion(true)
                        // Swifty JSON
                        guard let data = response.data else {return }
                        do {
                            
                            
                            let json = try JSON(data: data)
                            
                            self.userEmail = json["user"].stringValue
                            self.authToken = json["token"].stringValue
                            self.isLogged = true
                            print("\(self.userEmail)\n \(self.authToken)")
                        } catch {
                            completion(false)
                        }
                        
                        
                        //                            }
                        //                        case .failure:
                        //                            print("Login Failed")
                        //                        }
                    } else {
                        completion(false)
                        //
                        //                        authToken = response.data["token"]
                        //                        userEmail = response.data[email.lowercased()]
                    }
                   })
    }
    
    
    
    func createUser(name: String, email: String, avatarName: String,avatarColor: String , completion: @escaping completionHandler) {
        struct CreateUser: Encodable {
            let email: String
            let name: String
            let avatarName: String
            let avatarColor: String
        }
        
        
        let body: CreateUser = CreateUser(email: email.lowercased(), name: name, avatarName: avatarName, avatarColor: avatarColor)
        
        let myHeaders: HTTPHeaders = [
            "Content-Type": "application/json; charcter=utf-8",
            "Authorization": "Bearer \(AuthService.instance.authToken)"
        ]
        
        print("Auth Token:  \(AuthService.instance.authToken)")
        
        AF.request(CREATE_USER_URL,
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: myHeaders).response { (response) in
                    debugPrint(response)
                    if response.error == nil {
                        completion(true)
                        // Swifty JSON
                        guard let data = response.data else {return }
                        do {
                            let json = try JSON(data: data)
                            let id = json["_id"].stringValue
                            let name = json["name"].stringValue
                            let avatarName = json["avatarName"].stringValue
                            let avatarColor = json["avatarColor"].stringValue
                            
                            UserDataService.instance.setUserData(id: id, name: name, avatarName: avatarName, avatarColor: avatarColor)
                            
                            print("\(self.userEmail)\n \(self.authToken)")
                        } catch {
                            completion(false)
                        }
                        
                    } else {
                        completion(false)
                    }
        }
        
    }
}
