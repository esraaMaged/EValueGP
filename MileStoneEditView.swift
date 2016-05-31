//
//  MileStoneEditView.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/29/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class MileStoneEditView: UIViewController {

    
    
    @IBOutlet var mileStoneNameText: UITextField!
    
    @IBOutlet var startDate: UIDatePicker!
    
    
    @IBOutlet var deadlineDate: UIDatePicker!
    
    
    @IBOutlet var assignToText: UITextField!
    
    @IBOutlet var mileStoneDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.hidesBackButton = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func doneEditingButton(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
