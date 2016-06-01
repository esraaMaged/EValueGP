//
//  PasswordValidationScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/25/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class PasswordValidationScreen: UIViewController {

    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    
    @IBOutlet var myErrorLabel: UILabel!
    @IBOutlet var animateActivator: UIActivityIndicatorView!
    
    
    var userEmail:String!
    
    var newPassword:String!
   
    @IBOutlet var newPasswordTextField: UITextField!
    
    @IBOutlet var reEnterPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordTextField.text="2014"
    }

    
    @IBAction func updatePasswordButton(sender: AnyObject) {
        
        
        if(self.newPasswordTextField.text == self.reEnterPasswordTextField.text){
            
            print("The New Password is:\(self.newPasswordTextField.text!)")
            print("Re-Enter The Password is:\(self.reEnterPasswordTextField.text!)")
            print("The User Email is:\(userEmail)")
            
            var loginScreen = mainStoryboard.instantiateViewControllerWithIdentifier("myLoginScreen") as! LoginScreen
            
            self.navigationController?.pushViewController(loginScreen, animated: true)
            
            
            
            // print(self.newPassword)
            print("Your Password is Updated")
        }else{
            myErrorLabel.textColor = UIColor.redColor()
            myErrorLabel.text = "Please Check Your Entries"
            print("Please Check Your Entries")
        }
        
        
//        // URl
//        var url = NSURL(string: "http://api.androidhive.info/json/movies.json")
//        
//        // Request
//        var request = NSURLRequest(URL: url!)
//        
//        // Session
//        var session = NSURLSession(configuration:NSURLSessionConfiguration.defaultSessionConfiguration())
//        
//        //Enable Shared Application
//        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
//        
        animateActivator.startAnimating()
//        
//        // Task 
//        
//        let task = session.dataTaskWithRequest(request){(data,response,error) in
//        
//            do{
//                var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
//                let dict = json[0] as! NSDictionary
//                
//                self.newPassword = String( dict.objectForKey("releaseYear")!)
//            }catch{
//                    print("Check Your Network Issue")
//            }
//            
//            // Main Thread
//            
//            dispatch_async(dispatch_get_main_queue(), {
//                
//                
//              
//            })
// 
//        }
//        
//        //End of the task
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        animateActivator.stopAnimating()
//        task.resume()
    }

    @IBAction func backButton(sender: AnyObject) {
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
