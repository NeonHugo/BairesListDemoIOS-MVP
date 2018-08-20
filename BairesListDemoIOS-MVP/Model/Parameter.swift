//
//  Parameter.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/20/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import UIKit

class Parameter: Codable {
    var startDate: String
    var endDate: String
    var includeSuggested: Bool
    
    init(startDate: String, endDate : String, includeSuggested : Bool) {
        
        self.startDate = startDate
        self.endDate = endDate
        self.includeSuggested = includeSuggested
    }
    
    private enum CodingKeys: String, CodingKey {
        case startDate
        case endDate
        case includeSuggested
    }
    

}
