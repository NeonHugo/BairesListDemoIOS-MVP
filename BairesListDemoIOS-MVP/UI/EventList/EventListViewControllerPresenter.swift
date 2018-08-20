//
//  EventListViewControllerPresenter.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import Foundation

class EventListViewControllerPresenter {
    
    private let eventService:EventService
    private var eventView: EventView!
    
    init(eventService:EventService, eventView: EventView){
        self.eventService = eventService
        self.eventView = eventView
    }
}

extension EventListViewControllerPresenter: EventPresenter {
    func getEvents(startDate: String, endDate: String, includeSuggested: Bool) {
        eventService.getEvents(startDate: startDate, endDate: endDate, includeSuggested: true, callBack: { (events) in
            self.eventView!.setEvents(events: events)
        }) { (errorTxt) in
            self.eventView!.setEmptyEvents()
        }
    }
}



