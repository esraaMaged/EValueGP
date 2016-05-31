//
//  TaskInfo.swift
//  FinalProjectEvalue
//
//  Created by Fady Ramzy on 5/29/16.
//  Copyright © 2016 JETS. All rights reserved.
//

import Foundation

class TaskInfo {
    
    //Attributes
    var taskId:Int! 
    var taskName:String!
    var taskDescription:String!
    var taskEvaluation:Float!
    var taskStartDate:NSDate!
    var taskEndDate:NSDate!
    var taskProgress:String!
    
    /*Foreign Key*/
    var typeId:Int!
    var categoryId:Int!
    var ownerId:Int!
    var parentId:Int!
}