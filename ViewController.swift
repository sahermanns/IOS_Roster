//  ViewController.swift
//  ClassRoster
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  var group = [Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    if let count = userDefaults.objectForKey("launchCount") as? Int {
      let newCount = count+1
      userDefaults.setObject(newCount, forKey:"launchCount")
    } else {
      println("first launch!")
      let count = 1
      userDefaults .setObject(count, forKey:"launchCount")
    }
    userDefaults.synchronize()
    
    self.loadFromArchive()
    
    
    if self.group.isEmpty {
    if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
        
      if let plistArray = NSArray(contentsOfFile: filePath) {
          //println(plistArray.count)
        for personObject in plistArray {
          if let personDictionary = personObject as? NSDictionary {
            let firstName = personDictionary["firstName"] as String
            let lastName = personDictionary["lastName"] as String
            let person = Person(firstName: firstName, lastName: lastName)
            self.group.append(person)
            }
          }
        
        } else {
          
        }
        
    }
    self.saveToArchive()
    }
//    var sarah = Person(firstName: "Sarah", lastName: "Hermanns")
//    var kara = Person(firstName: "Kara", lastName: "Fortney")
//    var megan = Person(firstName: "Megan", lastName: "Miller")
//    var caitlin = Person(firstName: "Caitlin", lastName: "Warnock")
//    var aleesha = Person(firstName: "Aleesha", lastName: "Thurber")
//    var fran = Person(firstName: "Fran", lastName: "Skara")
//    var akimi = Person(firstName: "Akimi", lastName: "Hata")
//    var beccah = Person(firstName: "Beccah", lastName: "Jones")
//    var whitney = Person(firstName: "Whitney", lastName: "Clark")
//    
//    self.group.append(sarah)
//    self.group.append(kara)
//    self.group.append(megan)
//    self.group.append(caitlin)
//    self.group.append(aleesha)
//    self.group.append(fran)
//    self.group.append(akimi)
//    self.group.append(beccah)
//    self.group.append(whitney)
    
    
    self.tableView.dataSource = self
  }

  func loadFromArchive() {
    let path = getDocumentsPath()
    if let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as? [Person] {
       self.group = arrayFromArchive
    }
  }

  func saveToArchive() {
    let path = self.getDocumentsPath()
    println(path)
    NSKeyedArchiver.archiveRootObject(self.group, toFile: path + "/MyArchive")
  }

  func getDocumentsPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    let path = paths.first as String
    return path
  }

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.saveToArchive()
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.group.count
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
    let personToDisplay = self.group[indexPath.row]
    cell.personFirstLabel.text = personToDisplay.firstName
    cell.personLastLabel.text = personToDisplay.lastName
    
    if personToDisplay.image != nil {
      cell.personImageView.image = personToDisplay.image
    } else {
      cell.personImageView.image = UIImage(named: "seahawks.png")
    }
    
    return cell
  }

  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowGreen" {
      let destinationVC = segue.destinationViewController as
      PersonDetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let person = self.group[indexPath!.row]
      
      destinationVC.selectedPerson = person
    }
  }
}
  




