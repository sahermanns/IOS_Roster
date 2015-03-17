//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Sarah Hermanns on 3/1/15.
//  Copyright (c) 2015 SASH. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var firstNameLabel: UITextField!
  @IBOutlet weak var lastNameLabel: UITextField!
  var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if self.selectedPerson.image != nil {
      self.imageView.image = self.selectedPerson.image
    }
//    } else {
//      self.imageView.image = UIImage(named: "placeholder.png")
//    }
    
    self.title = self.selectedPerson.firstName
    self.firstNameLabel.delegate = self
    
    self.firstNameLabel.text = self.selectedPerson.firstName
    self.lastNameLabel.text = self.selectedPerson.lastName

  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    self.selectedPerson.firstName = self.firstNameLabel.text
    self.selectedPerson.lastName = self.lastNameLabel.text
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
  @IBAction func photosButtonPressed(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
      imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
    } else {
      imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }
    //present view controller is inherited from UIViewController
    self.presentViewController(imagePickerController, animated: true, completion: nil)
  }
 
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
//  We i update XCode it's going to make me add an ! to as for the casting of UIImage  
    let image = info[UIImagePickerControllerOriginalImage] as UIImage
    self.imageView.image = image
    self.selectedPerson.image = image
    
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  
}
