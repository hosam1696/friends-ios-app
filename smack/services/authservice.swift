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
    private let GET_USER_BY_EMAIl    = "\(API_URL)/user/byEmail"
    
    
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
                    switch response.result {
                        
                        
                    case .success:
                        print("Success")
                        guard let data = response.data else {return }
                        do {
                            
                            let json = try JSON(data: data)

                            
                            let message = json["message"].stringValue
                            if message != "" {
                                print("Error Message \(message)")
                                completion(message)
                            } else {
                                self.userEmail = json["user"].stringValue
                                self.authToken = json["token"].stringValue
                                self.isLogged = true
                                completion(true)
                            }
                            print("LoginUser: \(self.userEmail)\n \(self.authToken)")
                        } catch {
                            completion(false)
                        }
                        
                    case .failure:
                        guard let data = response.data else {return }
                                               do {
                                                   let json = try JSON(data: data)
                                                print("Error Message: \(json["message"].rawValue)")
                                               } catch {
                                                
                        }
                        completion(false)
                        
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
        
        
        let authHeaders: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.authToken)"
        ]
        
        let body: CreateUser = CreateUser(email: email.lowercased(), name: name, avatarName: avatarName, avatarColor: avatarColor)
        
        print("Auth Token:  \(self.authToken)")
        
        AF.request(CREATE_USER_URL,
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: authHeaders)
            //        .validate(401)
            .response { (response) in
                debugPrint(response)
                
     switch response.result {
         
         
     case .success:
                    print("response Body Add Account: \(response.data!)")
                    guard let data = response.data else {return }
                    do {
                        
                        let json = try JSON(data: data)
                     let message = json["message"].stringValue
                                               if message != "" {
                        print("Error Message \(message)")
                        completion(message)
                        
                    } else {

                        self.assignUserInfo(data: data, completion: completion)
                        completion(true)
                    }
                    } catch {
                        completion(false)
        }
                    
     case .failure:
                    completion(false)
                }
        }
        
    }
    
    
    func findUserByEmail(completion: @escaping completionHandler) {
        
        let authHeaders: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(self.authToken)"
        ]
        
        AF.request("\(GET_USER_BY_EMAIl)/\(userEmail)",
            method: .get,
            headers: authHeaders)
            .response { (response) in
                debugPrint(response)
                if response.error == nil {
                    // Swifty JSON
                    print("response Body Find User: \(response.data!)")
                    guard let data = response.data else {return }
                    
                    self.assignUserInfo(data: data, completion: completion)
                    
                } else {
                    completion(false)
                }
        }
    }
    
    func assignUserInfo(data: Data, completion: @escaping completionHandler) {
        do {
            
            let json = try  JSON(data: data)
            let id = json["_id"].stringValue
            let name = json["name"].stringValue
            let email = json["email"].stringValue
            let avatarName = json["avatarName"].stringValue
            let avatarColor = json["avatarColor"].stringValue
            
            UserDataService.instance.setUserData(id: id, name: name, avatarName: avatarName, avatarColor: avatarColor, email: email)
            
            print("\(self.userEmail)\n \(UserDataService.instance.id) | \(UserDataService.instance.name)")
            completion(true)
            
        } catch {
            completion(false)
        }
    }
    
    
    func logout() {
        userEmail = ""
        AuthService.instance.isLogged = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
}
