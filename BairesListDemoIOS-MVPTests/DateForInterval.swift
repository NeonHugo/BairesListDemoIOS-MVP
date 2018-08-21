//
//  DateForInterval.swift
//  BairesListDemoIOS-MVPTests
//
//  Created by NeoNHugo on 8/21/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import XCTest
@testable import BairesListDemoIOS_MVP

class DateForInterval: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTodayDate(){
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let result = formatter.string(from: date)
        
        XCTAssertEqual(result, "".todayPlusDaysString(numberOfDays: 0))
    }
    
    func testTodayPlus10Days(){
        let today = Date()
        let daysAfter10 = Calendar.current.date(byAdding: .day, value: 10, to: today)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        let result = formatter.string(from: daysAfter10!)
        
        XCTAssertEqual(result, "".todayPlusDaysString(numberOfDays: 10))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
