//
//  ViewController.swift
//  imageOfGameOfThrones
//
//  Created by Linyin Wu on 13/2/15.
//  Copyright (c) 2015 Linyin Wu. All rights reserved.
//

import UIKit

//global property "images" to store the images and method "accessTime" to get current time
var images = [Image]()
func accessTime() -> String {
    let accesstime = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    return String(accesstime)
}


class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //data initialize
        images = [Image(title: "Arya Stark", lastAccessTime: accessTime(), size: "399KB"),
            Image(title: "Bran Stark", lastAccessTime: accessTime(), size: "275KB"),
            Image(title: "Cersei Lannister", lastAccessTime: accessTime(), size: "2.5MB"),
            Image(title: "Daenerys Targaryen", lastAccessTime: accessTime(), size: "242KB"),
            Image(title: "Jaime Lannister", lastAccessTime: accessTime(), size: "2MB"),
            Image(title: "Jon Snow", lastAccessTime: accessTime(), size: "284KB"),
            Image(title: "Margaery Tyrell", lastAccessTime: accessTime(), size: "222KB"),
            Image(title: "Ygritte", lastAccessTime: accessTime(), size: "730KB")]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//implement TableView related protocols
//to count the number of tableview cell
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
//each cell display the title of the image
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        var image : Image = images[indexPath.row]
        
        cell.textLabel?.text = image.title
        return cell
        
    }
    
//when click the title, go to display the image
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToImage" {
            var vc = segue.destinationViewController as ImageViewController
            var indexPath = tableView.indexPathForSelectedRow()
            if let index = indexPath {
                vc.image = images[index.row]
            }
        }
    }
//when user click "enter" button on the ImageViewController to modify the title of the image, should return to the root view and reload data
    @IBAction func close(segue : UIStoryboardSegue) {
        tableView.reloadData()
    }
        
}

