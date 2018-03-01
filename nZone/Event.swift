//
//  Event.swift
//  nZone
//
//  Created by Dominic Philip on 2/28/18.
//  Copyright © 2018 Dominic Philip. All rights reserved.
//

import UIKit

class Event {
    var title: String
    var description: String
    var image: UIImage?
    var startTime: Date?
    var endTime: Date?
    
    init?(title: String, description: String, image: UIImage?, startTime: Date?, endTime: Date?) {
        self.title = title
        self.description = description
        self.image = image
        self.startTime = startTime
        self.endTime = endTime
        
        if title.isEmpty  {
            return nil
        }
    }
    
}
