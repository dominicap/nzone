//
//  Events.swift
//  nZone
//
//  Created by Dominic Philip on 2/27/18.
//  Copyright © 2018 Dominic Philip. All rights reserved.
//

import UIKit

class Events: UITableViewController {
    
    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadEventImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EventTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EventTableViewCell  else {
            fatalError("The dequeued cell is not an instance of EventTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let event = events[indexPath.row]
        
        cell.eventTitle.text = event.title
        cell.eventImage.image = event.image
        cell.eventTiming.text = event.timing
        
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    private func loadEventImages() {
        let liftingImage = UIImage(named: "lifting")
        let frisbeeImage = UIImage(named: "frisbee")
        let basketballImage = UIImage(named: "basketball")
        let churchImage = UIImage(named: "church")
        let soccerImage = UIImage(named: "soccer")
        
        guard let liftingEvent = Event(title: "Lifting", image: liftingImage, timing: "5PM - 7PM") else {
            fatalError("Unable to instantiate event")
        }
        
        guard let frisbeeEvent = Event(title: "Frisbee", image: frisbeeImage, timing: "5PM - 7PM") else {
            fatalError("Unable to instantiate event")
        }
        
        guard let basketballEvent = Event(title: "Basketball", image: basketballImage, timing: "5PM - 7PM") else {
            fatalError("Unable to instantiate event")
        }
        
        guard let churchEvent = Event(title: "Church", image: churchImage, timing: "5PM - 7PM") else {
            fatalError("Unable to instantiate event")
        }
        
        guard let soccerEvent = Event(title: "Soccer", image: soccerImage, timing: "5PM - 7PM") else {
            fatalError("Unable to instantiate event")
        }
        
        events += [liftingEvent, frisbeeEvent, basketballEvent, churchEvent, soccerEvent]
    }

}
