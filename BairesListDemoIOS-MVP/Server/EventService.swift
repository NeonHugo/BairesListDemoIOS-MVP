//
//  EventService.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//
//  Class responsible for the WebService access for retrieving data

import Foundation
import Alamofire

class EventService {
    
    func getEvents(startDate:String, endDate:String , includeSuggested:Bool, callBack:@escaping ([Event]) -> Void, callBackError:@escaping (String) -> Void){
        
        let urlString = "https://webservices.vividseats.com/rest/mobile/v1/home/cards"
        
        let params = Parameter(startDate: startDate, endDate: endDate, includeSuggested: includeSuggested)
        let jsonDataN = try! JSONEncoder().encode(params)
        let jsonString = String(data: jsonDataN, encoding: .utf8)!
        
        let url = URL(string: urlString)!
        let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("iOs", forHTTPHeaderField: "X-Mobile-Platform")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON {
            (response) in

            if let error = response.error {
                callBackError(error.localizedDescription)
            } else {
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        //to get JSON return value
                        if let result = response.data {
                            let events:[Event] = try! JSONDecoder().decode([Event].self, from: result)
                            
                            callBack(events)
                        }
                        
                    default:
                        callBackError((response.response?.description)!)
                    }
                }
            }
        }
    }
}
