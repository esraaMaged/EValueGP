//
//  AchievementsForMeViewController.swift
//  eValueRegistration
//
//  Created by Ahmed Hamdy on 5/31/16.
//  Copyright © 2016 ITI. All rights reserved.
//

import UIKit

class AchievementsForMeViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func slideValueChanged(sender: AnyObject) {
        
        self.label.text  = NSString(format: "%f", self.slider.value) as String
        
    
    
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
