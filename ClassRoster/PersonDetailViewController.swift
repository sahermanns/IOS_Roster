//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Sarah Hermanns on 3/1/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
  
  var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = self.selectedPerson.firstName
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
