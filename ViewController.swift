//  ViewController.swift
//  ClassRoster
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  //properties at the top
  @IBOutlet weak var myLabel: UILabel!
  var names = ["Sarah","Kara","Megan","Caitlin","Aleesha","Nici","Becca"]
  var index = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let name = "Sarah"
    myLabel.text = self.names[index]
    
  }
  
  //methods go below here
  
  @IBAction func leftPressed(sender: AnyObject) {
    println("left pressed")
    if self.index > 0 {
      index--
      self.myLabel.text = self.names[index]
    }

  }

  @IBAction func rightPressed(sender: AnyObject) {
    println("right pressed")
    if self.index < self.names.count - 1 {
      index++
      self.myLabel.text = self.names[index]
    }
  
  }
  
}

