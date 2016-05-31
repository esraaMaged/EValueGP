//
//  ViewController.swift
//  myNavDrawer
//
//  Created by Ahmed Hamdy on 5/19/16.
//  Copyright © 2016 Deu. All rights reserved.
//

import UIKit
import MMDrawerController

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    var taskList = [String]()
    var taskDescription = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        taskList = ["Task1","Task2","Task3","Task4"]
        taskDescription = ["Description 1","Description 2","Description 3","Description 4"]
        
        
        
        myTableView.tableFooterView = UIView()
           
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func NavMenu(sender: AnyObject) {
        
        var appDele: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDele.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion:nil)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = taskList[indexPath.row]
        cell.detailTextLabel?.text = taskDescription[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    
    
    

}

