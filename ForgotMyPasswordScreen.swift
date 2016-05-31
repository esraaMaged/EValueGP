//
//  ForgotMyPasswordScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/18/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class ForgotMyPasswordScreen: UIViewController {

    @IBOutlet var userEmailTextField: UITextField!
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    var emailAddressText:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Forgot My Password"
        
        
        userEmailTextField.text = "Dawn of the Planet of the Apes"
        
    }

    // Rendering Data From The Web Service
    
    
    @IBAction func checkButton(sender: AnyObject) {
        
        // Declaring The URL
        
        var url = NSURL(string: "http://api.androidhive.info/json/movies.json")
        
        // Declaring Request
        
        var request = NSURLRequest(URL: url!)
        
        // Declaring Session
        
        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        //Enable Shared Application
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.activityIndicator.startAnimating()
        
        //Declaring Task 
        
        let task = session.dataTaskWithRequest(request){ (data,response,error) in
        
            do{
            //Parsing Json
        
            var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
            
            let dict = json[0] as! NSDictionary
            
                self.emailAddressText = dict.objectForKey("title") as! String
                
            }catch {
            
                print("Check Your Network Issue")
            }
      
            //Main Thread
            dispatch_async(dispatch_get_main_queue(), {
                if(self.userEmailTextField.text == self.emailAddressText){
                    
                    print(self.userEmailTextField.text!)
                    print(self.emailAddressText)
                    print("Your Email Address is Correct")
                    
                    var second = self.storyboard?.instantiateViewControllerWithIdentifier("PasswordValidationScreen")as! PasswordValidationScreen
                    
                    second.userEmail = self.userEmailTextField.text
                    
                    self.navigationController?.pushViewController(second, animated: true)
                    
                }else{
                   self.myLabel.textColor = UIColor.redColor()
                   self.myLabel.text = "Your UserName is Incorrect"
                }
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                self.activityIndicator.stopAnimating()
            })
        }
        
        //End of Task Function
        task.resume()
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
