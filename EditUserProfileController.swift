//
//  EditUserProfileController.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/27/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit
import AssetsLibrary

class EditUserProfileController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet var myImageView: UIImageView!
    
    @IBOutlet var userEmailTextField: UITextField!
    
    @IBOutlet var userNameTextField: UITextField!
    
    @IBAction func doneBTN(sender: AnyObject) {
        
        //--------------------edit web Service-------------------------------------
        
        
        var url = NSURL(string:"http://10.118.48.254:9090/evalserv/rest/profile/edit?name=&password=&email=&gender=")
        
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
                
             
                
                
            }catch{
                print("Check Your Network Issue")
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                
                //Check if the data is returing  null
                

                
            })
        }
        task.resume()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
        
        //-----------------end of edit webService---------------------------------------
        
        
    }
    
    var userNameText:String!
    var userEmailText:String!
   // var userImageUrl:String!
    var userGender:[String]!
    var genderSelected:String!
    
    
    //Array of Strings
    var parameters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.text = userNameText
        userEmailTextField.text = userEmailText
        
        
        userGender = ["male","female"]
    
    //    var url = NSURL(string: userImageUrl)
    //    var data = NSData(contentsOfURL: url!)
     //   myImageView.image = UIImage(data: data!)
        
        
        
  //-------------------------------------webServices------------------------------------------------------------------
        var url = NSURL(string:"http://10.118.48.254:9090/evalserv/rest/profile/view?name=fady")
        
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
                
                self.userEmailText = dict.objectForKey("email") as! String
                self.userNameText = String (dict.objectForKey("name")!)
                self.genderSelected = String(dict.objectForKey("password")!)
                //  self.userImageUrl = dict.objectForKey("image") as! String
                
                
                self.parameters.append(self.userEmailText)
                self.parameters.append(self.userNameText)
                self.parameters.append(self.genderSelected)
                //     self.parameters.append(self.userImageUrl)
                
                
            }catch{
                print("Check Your Network Issue")
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                
                
                //Check if the data is returing  null
                
                for var i = 0 ; i < self.parameters.count ; ++i{
                    
                    if(self.parameters[i].isEmpty){
                        
                        print("Please Check Your Network Connection")
                        
                    }else{
                        self.userEmailTextField.text = self.userEmailText
                        self.userEmailTextField.text = self.userEmailText
                        self.userNameTextField.text = self.userNameText
                  //      self.genderSelected.text = self.userGender
                        
                        //    var  imageUrl = NSURL(string: self.userImageUrl)
                        //    var imageData = NSData(contentsOfURL: imageUrl!)
                        
                        
                        //      self.userImageView.image = UIImage(data: imageData!)
                        
                        
                    }
                    
                    //print(self.parameters[i])
                }
                
                
                
                
                
            })
        }
        task.resume()
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
  //-----------------------------------------webservice---------------------------------
    }
    
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return userGender.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return userGender[row]
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderSelected = userGender[row]
        print(genderSelected)
    }
    
    
    //Prepare For Segue Function
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "editPasswordSegue" {
            
            var editPasswordScreen = segue.destinationViewController as! EditPasswordPasswordScreen
            
            editPasswordScreen.userEmail = userEmailText
            editPasswordScreen.userName = userNameText
            editPasswordScreen.userGender = genderSelected
        //    editPasswordScreen.userImageSelected = userImageUrl
        
            
        }
        
        
    }
    
    
    //Select Image Button

    @IBAction func chooseImageButton(sender: AnyObject) {
//        //Image Picker Controller
    //    var imagePicker = UIImagePickerController()
    //    imagePicker.delegate = self
     //   imagePicker.sourceType = .PhotoLibrary
     //   self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//     //   myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        
//        //Get Image Name
//      
//    //    if let referenceUrl = info[UIImagePickerControllerReferenceURL] as? NSURL{
//        
//                ALAssetsLibrary().assetForURL(referenceUrl, resultBlock: { (asset) in
//                    
//                    self.userImageUrl = asset.defaultRepresentation().filename()
//                    
//                    print(self.userImageUrl)
//                    
//                    }, failureBlock: nil)
//        
//        }
  
   //     self.dismissViewControllerAnimated(true, completion: nil)
   // }
    
    
}
