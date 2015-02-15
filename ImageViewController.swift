//
//  ImageViewController.swift
//  imageOfGameOfThrones
//
//  Created by Linyin Wu on 13/2/15.
//  Copyright (c) 2015 Linyin Wu. All rights reserved.
//

import UIKit

class ImageViewController : UIViewController, UITextFieldDelegate {
    var image : Image?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageTitle: UITextField!
    @IBOutlet weak var numOfView: UILabel!
    @IBOutlet weak var lastAccessTime: UILabel!
    @IBOutlet weak var size: UILabel!
    @IBAction func enter(sender: AnyObject) {
        image!.title = imageTitle.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // at first I import some pictures, the Image class does not have property uiimage, but when I try to implement the "add" operation, I need it and I don't want to redesign the previous opearations, so I just take a if/else to identify how to display the image
        if (image!.uiimage == nil) {
            imageView.image = UIImage(named: image!.name)
        }else {
            imageView.image = image!.uiimage
        }
        
        imageTitle.delegate = self          //when user press "return" on the keyboard, should respond
        imageTitle.text = image!.title
        image!.numOfView = image!.numOfView + 1
        numOfView.text = "View times: \(image!.numOfView)"
        lastAccessTime.text = "Last access: \(image!.lastAccessTime)"
        image!.lastAccessTime = accessTime()            //update the access time
        size.text = "Size: \(image!.size)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//when user press "return" on the keyboard, should respond
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
//when user press other places on the screen to cancel the editing the title, should respond
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        imageTitle.resignFirstResponder()
    }
    
}

