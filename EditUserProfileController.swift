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
    
    
    var userNameText:String!
    var userEmailText:String!
    var userImageUrl:String!
    var userGender:[String]!
    var genderSelected:String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.text = userNameText
        userEmailTextField.text = userEmailText
        
        
        userGender = ["male","female"]
        
        var url = NSURL(string: userImageUrl)
        var data = NSData(contentsOfURL: url!)
        myImageView.image = UIImage(data: data!)
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
            editPasswordScreen.userImageSelected = userImageUrl
        
            
        }
        
        
    }
    
    
    //Select Image Button

    @IBAction func chooseImageButton(sender: AnyObject) {
        //Image Picker Controller
        var imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        myImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        //Get Image Name
        
        if let referenceUrl = info[UIImagePickerControllerReferenceURL] as? NSURL{
        
                ALAssetsLibrary().assetForURL(referenceUrl, resultBlock: { (asset) in
                    
                    self.userImageUrl = asset.defaultRepresentation().filename()
                    
                    print(self.userImageUrl)
                    
                    }, failureBlock: nil)
        
        }
  
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
