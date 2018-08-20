//
//  Event.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import Foundation

class Event : Codable {
    var topLabel : String
    var middleLabel : String
    var bottomLabel : String
    var eventCount : Int
    var targetId : Int
    var image : String
    var like : Int = 0
    var status : Int = 0
    
    init(topLabel : String, middleLabel : String, bottomLabel : String, eventCount : Int, targetId : Int, image : String) {
        
        self.topLabel = topLabel
        self.middleLabel = middleLabel
        self.bottomLabel = bottomLabel
        self.eventCount = eventCount
        self.targetId = targetId
        self.image = image
    }
    
    private enum CodingKeys: String, CodingKey {
        case topLabel
        case middleLabel
        case bottomLabel
        case eventCount
        case targetId
        case image
    }
}
