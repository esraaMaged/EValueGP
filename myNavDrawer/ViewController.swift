//
//  ViewController.swift
//  myNavDrawer
//
//  Created by Ahmed Hamdy on 5/19/16.
//  Copyright © 2016 Deu. All rights reserved.
//

import UIKit
import MMDrawerController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
           
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NavMenu(sender: AnyObject) {
        
        var appDele: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion:nil)
    }

}

