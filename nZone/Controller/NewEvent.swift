//
//  NewEvent.swift
//  nZone
//
//  Created by Dominic Philip on 2/27/18.
//  Copyright © 2018 Dominic Philip. All rights reserved.
//

import UIKit
import os.log

class NewEvent: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var event: Event?
    
    @IBOutlet weak var activityPicker: UIPickerView!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var titleText: String?
    var descriptionText: String?
    var image: UIImage?
    var startTime: Date?
    var endTime: Date?
    
    
    var pickerData = ["Lifting", "Frisbee", "Basketball", "Church", "Soccer", "Crossfit", "Batting Cages"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityPicker.delegate = self
        self.activityPicker.dataSource = self
        
        self.descriptionField.delegate = self
        
        self.titleText = "Lifting"
        self.startTime = startTimePicker.date
        self.endTime = endTimePicker.date
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        titleText = pickerData[row]
    }
    
    
    @IBAction func startTimeChanged(_ sender: Any) {
        startTime = startTimePicker.date
    }
    
    
    @IBAction func endTimeChanged(_ sender: Any) {
        endTime = endTimePicker.date
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        descriptionText = descriptionField?.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === doneButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        
        let lowerTitle = self.titleText?.lowercased()
        descriptionText = descriptionField.text
        
        image = UIImage(named: lowerTitle!)
        
        event = Event(title: titleText!, description: descriptionText!, image: image!, startTime: startTime!, endTime: endTime!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
