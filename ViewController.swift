//  ViewController.swift
//  ClassRoster
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var people = [Person]()
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Home"
    self.tableView.backgroundColor = UIColor.greenColor()
    self.tableView.dataSource = self
    self.tableView.delegate = self
    
    var sarah = Person(firstName: "Sarah", lastName: "Hermanns")
    var kara = Person(firstName: "Kara", lastName: "Fortney")
    var megan = Person(firstName: "Megan", lastName: "Miller")
    var caitlin = Person(firstName: "Caitlin", lastName: "Warnock")
    var aleesha = Person(firstName: "Aleesha", lastName: "Thurber")
    var fran = Person(firstName: "Fran", lastName: "Skara")
    var akimi = Person(firstName: "Akimi", lastName: "Hata")
    var beccah = Person(firstName: "Beccah", lastName: "Jones")
    var whitney = Person(firstName: "Whitney", lastName: "Clark")
    
    self.people.append(sarah)
    self.people.append(kara)
    self.people.append(megan)
    self.people.append(caitlin)
    self.people.append(aleesha)
    self.people.append(fran)
    self.people.append(akimi)
    self.people.append(beccah)
    self.people.append(whitney)
    
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowGreen" {
      println("showing green")
      let destinationVC = segue.destinationViewController as
      PersonDetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let person = self.people[indexPath!.row]
      destinationVC.selectedPerson = person
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    let person = self.people[indexPath.row]
    cell.textLabel?.text = person.firstName + " " + person.lastName
    
    return cell
  }
  
  }


