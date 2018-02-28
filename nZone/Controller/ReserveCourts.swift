//
//  ReserveCourts.swift
//  nZone
//
//  Created by Dominic Philip on 2/27/18.
//  Copyright © 2018 Dominic Philip. All rights reserved.
//

import UIKit

class ReserveCourts: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
