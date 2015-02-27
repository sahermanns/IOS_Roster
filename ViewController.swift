//  ViewController.swift
//  ClassRoster
//
//  Created by Bradley Johnson on 2/17/15.
//  Copyright (c) 2015 BPJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  let names = ["Sarah", "Kara", "Megan", "Caitlin", "Aleesha", "Fran", "Akimi","Becca", "Sean", "Carrie", "Monty", "Greg", "Patrick"]

  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    println("view will appear")
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    println("view did appear")
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.names.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    let name = self.names[indexPath.row]
    cell.textLabel?.text = name
    
    return cell
  }
  
  }


