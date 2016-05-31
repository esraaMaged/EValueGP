//
//  UserProfileScreen.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/26/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class UserProfileScreen: UIViewController {


    
    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var userImageView: UIImageView!
    
    @IBOutlet var userEmailLabel: UILabel!
    
    @IBOutlet var userUserNameLabel: UILabel!
    
    @IBOutlet var genderLabel: UILabel!
    
    var userName:String!
    var userEmail:String!
    var userGender:String!
    var userImageUrl:String!
    
    //Array of Strings
    var parameters = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        //URl
        var url = NSURL(string: "http://api.androidhive.info/json/movies.json")
        
        //Request
        var request = NSURLRequest(URL: url!)
        
        //Session
        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        //Enable Shared Application
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        
        //Task
        let task = session.dataTaskWithRequest(request){
            (data,response,error) in
        
            do{
                var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSArray
                
                let dict = json[0] as! NSDictionary
                
                self.userEmail = dict.objectForKey("title") as! String
                self.userName = String (dict.objectForKey("releaseYear")!)
                self.userGender = String(dict.objectForKey("rating")!)
                self.userImageUrl = dict.objectForKey("image") as! String
                
                
                self.parameters.append(self.userEmail)
                self.parameters.append(self.userName)
                self.parameters.append(self.userGender)
                self.parameters.append(self.userImageUrl)
                
                
            }catch{
                print("Check Your Network Issue")
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                
                //Check if the data is returing  null
                
                for var i = 0 ; i < self.parameters.count ; ++i{
                    
                    if(self.parameters[i].isEmpty){
                        
                        print("Please Check Your Network Connection")
                        
                    }else{
                        self.welcomeLabel.text = self.userEmail
                        self.userEmailLabel.text = self.userEmail
                        self.userUserNameLabel.text = self.userName
                        self.genderLabel.text = self.userGender
                        
                        var  imageUrl = NSURL(string: self.userImageUrl)
                        var imageData = NSData(contentsOfURL: imageUrl!)
                        
                        
                        self.userImageView.image = UIImage(data: imageData!)
                    
                        
                    }
                    
                    //print(self.parameters[i])
                }
                
                
                
                

            })
        }
        task.resume()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }

  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "editProfileSegue"{
        
                let editProfileScreen = segue.destinationViewController as! EditUserProfileController
            
                    editProfileScreen.userEmailText = userEmail
                    editProfileScreen.userNameText = userName
                    editProfileScreen.userImageUrl = userImageUrl
                    editProfileScreen.genderSelected = userGender
        }
        
        
        
    }
    
}
