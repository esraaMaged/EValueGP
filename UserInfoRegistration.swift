//
//  UserInfo.swift
//  EvalueRegistration
//
//  Created by Fady Ramzy on 5/19/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import UIKit

class UserInfoRegistration: NSObject {
    
    var name : String!
    var email : String!
    var password : String!
    var gender : String!
    
    
    init(name : String , email :String , password : String , gender : String) {
        
        self.name = name;
        self.email = email;
        self.password = password;
        self.gender = gender;
    }

}
