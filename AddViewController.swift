//
//  AddViewController.swift
//  imageOfGameOfThrones
//
//  Created by Linyin Wu on 14/2/15.
//  Copyright (c) 2015 Linyin Wu. All rights reserved.
//

import UIKit

class AddViewController : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {
    var newImage = Image(title: "initial", lastAccessTime: accessTime(), size: "0KB")
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var sizeText: UITextField!
    @IBAction func add(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
   
    @IBAction func enter(sender: AnyObject) {
        newImage.title = titleText.text
        newImage.size = sizeText.text
        images.append(newImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.delegate = self
        sizeText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//UIImagePickerControllerDelegate method
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: nil)
        newImage.uiimage = image
        
    }
//UIImagePickerControllerDelegate methods
//when user press "return" on the keyboard, should respond
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//when user press other places on the screen to cancel the editing the title, should respond
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        titleText.resignFirstResponder()
        sizeText.resignFirstResponder()
    }

}
