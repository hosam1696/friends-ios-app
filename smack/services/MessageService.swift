//
//  MessageService.swift
//  smack
//
//  Created by Hosam Elnabawy on 12/22/19.
//  Copyright © 2019 Hosam Elnabawy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class MessageService {
    static let instance = MessageService()
    
    private let GET_CHANNELS = "\(API_URL)/channel"
    private let ADD_CHANNEL  = "\(API_URL)/channel/add"
    
    var channels: [ChannelModel] = []
    
    func getChannels(completion: @escaping completionHandler) {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(AuthService.instance.authToken)"
        ]
        AF.request(GET_CHANNELS, method: .get, headers: headers)
        .response{ (response) in
        
            switch response.result {
            case .success:
                print("Success")
                guard let data = response.data else {return }
                do {
               
                if let json =  try JSON(data: data).array {
                    for item in json {
                        print(item)
                        let name = item["name"].stringValue
                        let description = item["description"].stringValue
                        let id = item["_id"].stringValue
                        
                        let channel = ChannelModel(channelTitle: name, channelDescription: description, id: id)
                        self.channels.append(channel)
                    }
                    print("Channels Count \(self.channels.count)")
                    completion(true)
                }
                    
                } catch {
                    debugPrint(response)
                    completion(false)
                }
                
            case .failure:
               debugPrint(response)
                completion(false)
            }
        }
        
        
    }
    
    
    func addChannel(name: String, description: String, completion: @escaping completionHandler) {
        struct channel: Encodable {
            var name: String
            var description: String
        }
        let headers: HTTPHeaders = [
               "Content-Type": "application/json",
               "Authorization": "Bearer \(AuthService.instance.authToken)"
        ]
        
        
        AF.request(ADD_CHANNEL, method: .post, parameters: channel(name: name, description: description) , encoder: JSONParameterEncoder.default, headers: headers)
            .response { (response) in
                switch response.result {
                case .success:
                    print("Success")
                    guard let data = response.data else {return }
                    do {
                   
                    let json =  try JSON(data: data)
                        let message = json["message"].stringValue
                        if message == "Channel saved successfully" {
                            completion(true)
                            self.getChannels(){s in
                                print("Getting Channels")
                            }
                        } else {
                            completion(false)
                        }
                        
                    }
                        
                    catch {
                        debugPrint(response)
                        completion(false)
                    }
                    
                case .failure:
                   debugPrint(response)
                    completion(false)
                }
        }
    }
}
