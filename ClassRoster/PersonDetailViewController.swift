//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Sarah Hermanns on 3/1/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var firstNameLabel: UITextField!
  
  @IBOutlet weak var lastNameLabel: UITextField!
  
  var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = self.selectedPerson.firstName + " " + self.selectedPerson.lastName
    self.firstNameLabel.delegate = self
    self.lastNameLabel.delegate = self
    
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
