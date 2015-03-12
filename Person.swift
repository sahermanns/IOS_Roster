//
//  Person.swift
//  ClassRoster
//
//  Created by Bradley Johnson on 2/19/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class Person {
  var firstName : String
  var lastName = "Doe"
  var image : UIImage?
  
  init(firstName : String, lastName : String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  class func loadPersons(){
    
  }
}
