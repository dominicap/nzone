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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, h:mm a"
        
        let startTime = formatter.string(from: (event.startTime)!)
        let endTime = formatter.string(from: (event.endTime)!)
        
        cell.eventTitle.text = event.title + " - " + event.description
        cell.eventImage.image = event.image
        cell.eventTiming.text = startTime + " - " + endTime
        
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    @IBAction func unwindToEventList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewEvent, let event = sourceViewController.event {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: events.count, section: 0)
            
            events.append(event)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    private func loadEventImages() {
        let liftingImage = UIImage(named: "lifting")
        let frisbeeImage = UIImage(named: "frisbee")
        let basketballImage = UIImage(named: "basketball")
        let churchImage = UIImage(named: "church")
        let soccerImage = UIImage(named: "soccer")
        let crossfitImage = UIImage(named: "crossfit")
        let battingCagesImage = UIImage(named: "batting cages")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy hh:mm a"
        
        let liftingStartDate = dateFormatter.date(from: "01-15-2018 6:30 PM")
        let liftingEndDate = dateFormatter.date(from: "01-15-2018 8:00 PM")
        let liftingDescription = "Practice your form with our top rated trainers."
        
        guard let liftingEvent = Event(title: "Lifting", description: liftingDescription, image: liftingImage, startTime: liftingStartDate, endTime: liftingEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let frisbeeStartDate = dateFormatter.date(from: "01-26-2018 4:00 PM")
        let frisbeeEndDate = dateFormatter.date(from: "01-26-2018 6:00 PM")
        let frisbeeDescription = "Learn the rules of the game and have fun in our inagural meetup."
        
        guard let frisbeeEvent = Event(title: "Frisbee", description: frisbeeDescription, image: frisbeeImage, startTime: frisbeeStartDate, endTime: frisbeeEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let basketballStartDate = dateFormatter.date(from: "02-06-2018 3:30 PM")
        let basketballEndDate = dateFormatter.date(from: "02-06-2018 6:00 PM")
        let basketballDescription = "Competitive pickup game with your friends, the classic 5 v 5."
        
        guard let basketballEvent = Event(title: "Basketball", description: basketballDescription, image: basketballImage, startTime: basketballStartDate, endTime: basketballEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let churchStartDate = dateFormatter.date(from: "02-12-2018 5:30 PM")
        let churchEndDate = dateFormatter.date(from: "02-12-2018 6:30 PM")
        let churchDescription = "Learn how to balance your faith with your hectic lifestyle."
        
        guard let churchEvent = Event(title: "Church", description: churchDescription, image: churchImage, startTime: churchStartDate, endTime: churchEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let soccerStartDate = dateFormatter.date(from: "02-24-2018 5:30 PM")
        let soccerEndDate = dateFormatter.date(from: "02-24-2018 6:30 PM")
        let soccerDescription = "Practice your freekicks and penalities with top rated scouts from the area."
        
        guard let soccerEvent = Event(title: "Soccer", description: soccerDescription, image: soccerImage, startTime: soccerStartDate, endTime: soccerEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let battingStartDate = dateFormatter.date(from: "03-04-2018 2:30 PM")
        let battingEndDate = dateFormatter.date(from: "03-04-2018 4:30 PM")
        let battingDescription = "Perfect your homerun hitting form with state of the art facilities."
        
        guard let battingEvent = Event(title: "Batting Gages", description: battingDescription, image: battingCagesImage, startTime: battingStartDate, endTime: battingEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        let crossfitStartDate = dateFormatter.date(from: "03-22-2018 8:00 PM")
        let crossfitEndDate = dateFormatter.date(from: "03-22-2018 10:30 PM")
        let crossfitDescription = "Improve your overall fitness and make new friends at the annual crossfit event."
        
        guard let crossfitEvent = Event(title: "Crossfit", description: crossfitDescription, image: crossfitImage, startTime: crossfitStartDate, endTime: crossfitEndDate) else {
            fatalError("Unable to instantiate event")
        }
        
        events += [liftingEvent, frisbeeEvent, basketballEvent, churchEvent, soccerEvent, battingEvent, crossfitEvent]
    }

}
