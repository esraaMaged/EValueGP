//
//  LoginScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/18/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit


protocol loginDelegate {
    func clearData()
}


class LoginScreen: UIViewController, loginDelegate {
    var acccountChild:String!
    
    
    
    
    
    //An Object From The App Delegate
  
  var appDele: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    // Declare NSDictionary for the json
    @IBOutlet var myErrorLabel: UILabel!
    
    @IBOutlet var mySwitch: UISwitch!
    
    @IBAction func mySwitchButton(sender: AnyObject) {
        
        getAccountStatus()
        
    }
    
    @IBOutlet var myActivityAnimator: UIActivityIndicatorView!
  
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    @IBAction func loginButton(sender: AnyObject) {
        var myStatus:String!
        var myReleaseYear:String!
        
        //URL
        var url = NSURL(string:"http://api.androidhive.info/json/movies.json")
        
        
         //var url = NSURL(string:"http://10.118.48.254:9090/evalserv/rest/login/verify?name=\(emailTextField.text)&password=\(passwordTextField.text)")
        
        //Request
        var request = NSURLRequest(URL: url!)
        
        //Session
        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        //Enable Shared Application
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
         self.myActivityAnimator.startAnimating()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            do{
                var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
               
                let dict = json[0] as! NSDictionary
                
                myStatus = dict.objectForKey("title") as! String
                myReleaseYear = String(dict.objectForKey("releaseYear")!)

            }catch{

                print("Check Your Network Issue")
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                print(myStatus)
                
         if(self.emailTextField.text == myStatus && self.passwordTextField.text == myReleaseYear &&           self.acccountChild == "NotAChildAccount"){
                    print(myStatus)
                    print(myReleaseYear)
                    print(self.acccountChild)
                    print("Your Data is right")
//                    var second = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                    //second.myDelegate = self
            
                    self.presentViewController(self.appDele.centerContainer!, animated: true, completion: nil)
                }else if (self.emailTextField.text == myStatus && self.passwordTextField.text == myReleaseYear && self.acccountChild == "ChildAccount"){
                    print(myStatus)
                    print(myReleaseYear)
                    print(self.acccountChild)
                    print("Your Data is right")
//                    var third = self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                    //third.myDelegate = self
                    self.presentViewController(self.appDele.centerContainer!, animated: true, completion: nil)
                }else{
            
                    self.myErrorLabel.textColor = UIColor.redColor()
                    self.myErrorLabel.text = "Check Your Info"
            
                    print(myStatus)
                    print(myReleaseYear)
                    print(self.acccountChild)
                    print("Check Your Info")
                }
                self.myActivityAnimator.stopAnimating()
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
           })
            
        }
        task.resume()
        
      }
    
    
    
    
    
    
       override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login Page"
        
        emailTextField.text = "Dawn of the Planet of the Apes"
        passwordTextField.text = "2014"
        
       //
        self.navigationItem.hidesBackButton = true
        
        getAccountStatus()
        
    }

  
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "myCreateAccountSegue"{
            let createAccountController = segue.destinationViewController as! CreateAccountScreen
        }else if  segue.identifier == "myForgotPasswordSegue" {
            let forgotMyPasswordScreen = segue.destinationViewController as! ForgotMyPasswordScreen
        }
    }
  
    //Switch Button Function
    func getAccountStatus(){
        if mySwitch.on {
            acccountChild = "ChildAccount"
            print(acccountChild)
        }else{
            acccountChild = "NotAChildAccount"
            print(acccountChild)
        }
    }
    
    //Delegate Function Implementation
    func clearData() {
        emailTextField.text = ""
        passwordTextField.text = ""
        myErrorLabel.text = ""
        mySwitch.on = false
    }
    
}
