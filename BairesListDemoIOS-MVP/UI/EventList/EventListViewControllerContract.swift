//
//  EventListViewControllerContract.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import Foundation


protocol EventView {
    func startLoading()
    func finishLoading()
    func setEvents(events: [Event])
    func setEmptyEvents()
}

protocol EventPresenter {
    func getEvents(startDate:String, endDate:String , includeSuggested:Bool)
}
