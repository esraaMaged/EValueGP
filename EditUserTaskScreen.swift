//
//  EditUserTaskScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/28/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class EditUserTaskScreen: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet var taskNameText: UITextField!
    
    @IBOutlet var progressLabel: UILabel!
    
    var taskArray = ["Task 1","Task 2","Task 3","Task 4"]
    var taskSelected:String!
    
    @IBOutlet var startDate: UIDatePicker!
    
    @IBOutlet var deadlineDate: UIDatePicker!
    
    var startDateSelected:NSDate!
    
    var deadlineSelected:NSDate!
    
    
    @IBOutlet var completionProgress: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        startDate.addTarget(self, action: "startDateChanged", forControlEvents: .ValueChanged)
        deadlineDate.addTarget(self, action: "deadlineChanged", forControlEvents: .ValueChanged)
//        startDateSelected = startDate.date
//        deadlineSelected = deadlineDate.date
//        
//        print(startDateSelected)
//        print(deadlineSelected)

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return taskArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return taskArray[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        taskSelected = taskArray[row]
        print(taskSelected)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func startDateChanged(){
        startDateSelected = startDate.date
        print(startDateSelected)
    }
    
    func deadlineChanged(){
        deadlineSelected = deadlineDate.date
        print(deadlineSelected)
    }

}
