//
//  EventListViewController.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/15/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController{
    
    @IBOutlet weak var listTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var retryButton: UIButton!
    

    
    @IBOutlet weak var statusIndicator: UIActivityIndicatorView!
    var eventPresenter: EventPresenter!
    
    var events = [Event]()
    var eventsFilters = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.dataSource = self
        listTableView.delegate = self
        
        setupSearchBar()
        
        eventPresenter = EventListViewControllerPresenter(eventService: EventService(),  eventView: self)
        
        startLoading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupSearchBar(){
        searchBar.delegate = self
        searchBar.placeholder = "Event"
    }
    
    @IBAction func retryButtonAction(_ sender: UIButton) {
        startLoading()
    }
}


extension EventListViewController: UITableViewDataSource, UITableViewDelegate, CheckBoxDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsFilters.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventListTableViewCell
        
        cell.img.sd_setImage(with: URL(string: eventsFilters[indexPath.row].image), placeholderImage: UIImage(named: "back"), completed: { (image, error, cacheType, imageURL) in
        })
        
        cell.topText.text = eventsFilters[indexPath.row].topLabel
        cell.middleText.text = eventsFilters[indexPath.row].middleLabel
        cell.bottomText.text = eventsFilters[indexPath.row].bottomLabel
        
        if (eventsFilters[indexPath.row].like == 1){
            cell.like.isChecked = true
        } else {
            cell.like.isChecked = false
        }
        
        if (searchBar.selectedScopeButtonIndex == 2){
            cell.like.canChange = false
        } else {
            cell.like.canChange = true
        }
        
        cell.like.delegate = self
        cell.like.idrow = indexPath.row

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let view = eventsFilters[indexPath.row].status
        
        if (view != 1){
            eventsFilters[indexPath.row].status = 1
        }
    }
    
    func changedStatus(id: Int, status: Bool) {
        
        if (status){
            eventsFilters[id].like = 1
        } else {
            eventsFilters[id].like = 0
        }
    }
    
}

extension EventListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterResults()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterResults()
    }
    
    func filterResults(){
        let opc = searchBar.selectedScopeButtonIndex
        let searchText = searchBar.text ?? ""
        
        switch opc {
        case 1:
            eventsFilters = events.filter { event in
                let isMatchingSearchText =  (event.middleLabel.lowercased().contains(searchText.lowercased())
                    || searchText.count == 0) && event.status == 1
                return isMatchingSearchText
            }
        case 2:
            eventsFilters = events.filter { event in
                let isMatchingSearchText =  (event.middleLabel.lowercased().contains(searchText.lowercased())
                    || searchText.count == 0) && event.like == 1
                return isMatchingSearchText
            }
        default:
            eventsFilters = events.filter { event in
                let isMatchingSearchText =  event.middleLabel.lowercased().contains(searchText.lowercased())
                    || searchText.count == 0
                return isMatchingSearchText
            }
        }
        
        listTableView.reloadData()
    }
}

extension EventListViewController: EventView {
    func startLoading() {
        activityIndicator!.startAnimating()
        //
        activityIndicator.isHidden = false
        listTableView.isHidden = true
        retryButton.isHidden = true
        //
        eventPresenter.getEvents(startDate: "".todayPlusDaysString(numberOfDays: 0), endDate: "".todayPlusDaysString(numberOfDays: 10), includeSuggested: true)
    }
    
    func finishLoading() {
        activityIndicator.isHidden = true
        listTableView.isHidden = false
        retryButton.isHidden = true
    }
    
    func setEvents(events: [Event]) {
        //
        self.events = events
        self.eventsFilters = events
        //
        listTableView.reloadData()
        //
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        listTableView.isHidden = false
        retryButton.isHidden = true
    }
    
    func setEmptyEvents() {
        activityIndicator.isHidden = true
        listTableView.isHidden = true
        retryButton.isHidden = false
    }
}

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

extension UIImageView{
    func addBlackGradientLayer(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
}
