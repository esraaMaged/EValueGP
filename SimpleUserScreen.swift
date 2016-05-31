//
//  SimpleUserScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/19/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class SimpleUserScreen: UIViewController {

    
    var myDelegate = loginDelegate?()
 
    @IBAction func myLogoutButton(sender: AnyObject) {
        
        myDelegate?.clearData()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
