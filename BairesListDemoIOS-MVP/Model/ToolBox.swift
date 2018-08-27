//
//  ToolBox.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/27/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func todayPlusDaysString(numberOfDays: Int) -> String {
        let today = Date()
        let daysAfter = Calendar.current.date(byAdding: .day, value: numberOfDays, to: today)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let result = formatter.string(from: daysAfter!)
        
        return result
    }
}

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
