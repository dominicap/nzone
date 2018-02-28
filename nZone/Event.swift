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
    var image: UIImage?
    var timing: String
    
    init?(title: String, image: UIImage?, timing: String) {
        self.title = title
        self.image = image
        self.timing = timing
        
        if title.isEmpty || timing.isEmpty  {
            return nil
        }
    }
    
}
