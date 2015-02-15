//
//  Image.swift
//  imageOfGameOfThrones
//
//  Created by Linyin Wu on 13/2/15.
//  Copyright (c) 2015 Linyin Wu. All rights reserved.
//

import UIKit

class Image {
    var numOfView : Int = 0
    var title : String
    let name : String
    var lastAccessTime : String
    var size : String
    var uiimage : UIImage? = nil
    
    init(title : String, lastAccessTime: String, size : String) {
        self.title = title
        self.name = title
        self.lastAccessTime = lastAccessTime
        self.size = size
    }
}
