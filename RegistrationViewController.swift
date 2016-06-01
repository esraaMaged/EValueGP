//
//  ViewController.swift
//  eValueRegistration
//
//  Created by Ahmed Hamdy on 5/22/16.
//  Copyright © 2016 ITI. All rights reserved.
//

import UIKit


class RegistrationViewController: UIViewController, UIPickerViewDataSource , UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate , UITextFieldDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var testingTF: UITextField!
    @IBOutlet weak var nameTF: TJTextField!
    @IBOutlet weak var emailTF: TJTextField!
    @IBOutlet weak var passwordTF: TJTextField!    
    var emailFound : String?
    @IBOutlet weak var imagePicked: UIButton!
    @IBAction func chooseImageAction(sender: AnyObject) {
        
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            
            let imagePicker = UIImagePickerController();
            
                    imagePicker.delegate = self
            
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary;
            
                    imagePicker.allowsEditing = true
            
            self.presentViewController(imagePicker, animated : true, completion : nil)
            
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicked.setBackgroundImage(image, forState: UIControlState.Normal)
        self.dismissViewControllerAnimated(true, completion: nil);
        self.imagePicked.layer.borderWidth = 3.0;
        
    }
    
    var genderType:String!
    var gender = [String]()
    //var user : UserInfoRegistration = UserInfo(name: "", email: "", password: "", gender: "")
    
    
    var jsonObject: [String: AnyObject]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicked.layer.cornerRadius = self.imagePicked.frame.size.width / 2;
        self.imagePicked.clipsToBounds = true;
        gender = ["male","female"]
        self.view.backgroundColor = UIColor.darkGrayColor();
    
        nameTF.delegate = self;
        emailTF.delegate = self;
        
//        UIGraphicsBeginImageContext(self.view.frame.size);
//        UIImage(named: "esraa-01.png")?.drawInRect(self.view.bounds);
//        
//        var image : UIImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.view.backgroundColor = UIColor(patternImage: image);
        
        
   
        
    }
    
    @IBAction func registerAction(sender: AnyObject) {
        
        
        
        
        
        if(nameTF.text?.characters.count < 3){
            nameLabel.text = "*Must be at least 3 Characters."
            nameTF.lineColor = UIColor.redColor();
            return;
        }
        
        if(!isValidEmail(emailTF.text!)){
            
            nameLabel.text = " "
            nameTF.lineColor = UIColor.grayColor();
            emailLabel.text = "*Not a valid Email Address."
            emailTF.lineColor = UIColor.redColor();
            return;
            
        }
        
        if(passwordLabel.text?.characters.count < 7){
            
            emailLabel.text = " "
            emailTF.lineColor = UIColor.grayColor();
            
            
            passwordLabel.text = "at Least 6 characters";
            passwordTF.lineColor =  UIColor.redColor();

            
            
        }
        
        
        let userName : String? = nameTF.text;
        let userEmail : String? = emailTF.text;
        let userPassword : String? = passwordTF.text;
        let userGender : String? = genderType;
        

//        
//        user.email = emailTF.text;
//        user.gender = genderType;
//        user.password = passwordTF.text;
//        user.name = nameTF.text;
//        
// 
//        print(user.name)
        
       
        
        // check for null.
        
        if(userEmail!.isEmpty || userPassword!.isEmpty || userGender!.isEmpty || userName!.isEmpty)
        {
            showAlert("all fields are Required!");
            
       // let alert = UIAlertView(title: "Salma", message: "Hellooooo", delegate: self, cancelButtonTitle: "Cancel", otherButtonTitles: "Ok");
      // alert.show();
            return;
        }
        
        // validation.
        
        
        
        
        
       
        
        //
        
        
        
        
        // web Service connection
        
//        
//        let urlCheckEmail = NSURL(string: "http://192.168.0.102:9090/evalserv/rest/register/checkuser?email=\(emailTF.text!)&name=\(nameTF.text!)");
//        let requestCheckEmail = NSMutableURLRequest(URL : urlCheckEmail!);
//        
//        
//        let taskCheckEmail = NSURLSession.sharedSession().dataTaskWithRequest(requestCheckEmail) {
//            data, response, error in
//            
//            if(error != nil){
//                print("error from err:\(error)")
//                return;
//                
//            }
//            
//            do{
//                var err : NSError?
//                var json =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
//                
//                var result  = json.objectForKey("repeated") as! String;
//                
//                
//                
//                
//                if(result == "email" || result == "name"){
//                   self.emailFound = "EmailFound";
//                    print(result)
//                }
//                else
//                {
//                    self.emailFound = "EmailNotFound"
//                }
//                
//                
//                
//            }
//            catch let errorr as NSError{
//                
//                print(errorr.localizedDescription)
//                print("Inside Catch");
//            }
//            
//            
//        }
//        taskCheckEmail.resume();
// 
        
        
        
        //Second Web Service to Send all data
        
        
        
        
        
        
        
//        if(self.emailFound == "EmailNotFound")
//
//        {
        passwordLabel.text = " "
        passwordTF.lineColor = UIColor.grayColor();
        
        let url = NSURL(string: "http://192.168.0.101:9090/evalserv/rest/register/newuser?name=\(nameTF.text!)&password=\(passwordTF.text!)&email=\(emailTF.text!)&gender=\(userGender!)");
        
        
        let request = NSMutableURLRequest(URL: url!);
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if(error != nil){
                print("error from err:\(error)")
                return;
                
            }
            
            do{
                var err : NSError?
                var json =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary
                
                var result = json.objectForKey("status") as! String;
                print(result);
                
                switch(result)
                {
                case "success" :
                     self.showAlert("Successfully Registered..")
                     break;
                    
                case "name" :
                    self.showAlert("Sorry! Somebody else has this userName,Please enter another one..")
                    return;
                
                    
                 case "email":
                    self.showAlert("This Email is already Registered!");
                    return;
                    
                 case "both":
                    self.showAlert("Both your User Name and Email are already existed..")
                    return;
                    
                default:
                    break;
                }
                
                
                
                
            }
            catch{
                print("Inside Catch");
            }
   
            
        }
        task.resume();
        
//    }
        
        
//        else
//        {
//            
//            showAlert("Email already Registered..");
//            return;
//
//            
//        }
 
        
//        do{
//        
//            jsonObject = ["name": user.name , "gender" : user.gender , "password" : user.password , "email" : user.name]
//        
//            let jsonData = try NSJSONSerialization.dataWithJSONObject(jsonObject!, options: .PrettyPrinted)
//            
//            //let data : NSData = NSKeyedArchiver.archivedDataWithRootObject(jsonObject!)
//
//        
//            let valid = NSJSONSerialization.isValidJSONObject(jsonObject!);
//        
//        
//        
//            var url = NSURL(string: "http://197.164.216.164:9090/evalserv/rest/register/newuser");
//        
//            var  request = NSMutableURLRequest(URL: url!);
//              request.HTTPMethod = "Post";
//
//             //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//             //request.HTTPBody = jsonObject.
//        
//             var err : NSError?
//        
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue("application/json", forHTTPHeaderField: "Accept")
//            request.HTTPBody =  try NSJSONSerialization.dataWithJSONObject(jsonObject!, options: [])
//            //var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration());
//
////            let task = session.dataTaskWithRequest(request) {
////                 (data,response,error) in
////                do {
////        
////        
////        
////            }
//
//            let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//                
//                    data, response, error in
//                
//                if(error != nil){
//                    print("error) ")
//                }
//                
//                
//                var json = NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers);
//                
//                
//                
//                
//                
//            }
//            
//             task.resume();
//        }
//        catch{
//            print("error")
//        }
//        
        
        
//        var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration());
//        
//        
//        let task = session.dataTaskWithRequest(request) {
//             (data,response,error) in
//            
//            
//            
//            
//            do {
//                
//    var json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//                
//                //let dic = json[0] as! NSDictionary;
//                
//                
//                
//                
//                var x : NSString = json.objectForKey("key") as! NSString
//                
//                print(x);
//            }
//            
//            
//            catch{
//                print("URL connection error");
//            }
//            
//            
//            
//            
//        }
//        
        
  
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        genderType = gender[row]
        print(genderType)
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
       
        var pickerLabel = view as? UILabel;

            if (pickerLabel == nil)
        
            {
                        pickerLabel = UILabel()
                        pickerLabel?.font = UIFont(name: "Times New Roman", size: 16)
                
                        pickerLabel?.textAlignment = NSTextAlignment.Center;

             }

                pickerLabel?.text = gender[row];
                return (pickerLabel)!;
   
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    
    
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.tag == 3 {
            if(!isValidEmail(emailTF.text!)){
                
                let myAlert = UIAlertController(title: "Alert", message: "SomeThing is going Wrong", preferredStyle: UIAlertControllerStyle.Alert);
                let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
                    action in
                    //self.dismissViewControllerAnimated(true, completion: nil);
                };
                
                myAlert.addAction(alertAction);
                self.presentViewController(myAlert , animated : true , completion : nil );
                
            }
        }
        
        else if textField.tag == 5 {
            
            
            
            let myAlert = UIAlertController(title: "Alert", message: "From testingTF", preferredStyle: UIAlertControllerStyle.Alert);
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
                action in
                //self.dismissViewControllerAnimated(true, completion: nil);
            };
            
            myAlert.addAction(alertAction);
            self.presentViewController(myAlert , animated : true , completion : nil );

            
        }
    }
    
    func showAlert(userMessage : String){
        
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        myAlert.addAction(alertAction);
        self.presentViewController(myAlert , animated : true , completion : nil );
        
    }


}

