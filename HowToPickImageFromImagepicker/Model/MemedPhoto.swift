//
//  File.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 07.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import Foundation
import UIKit


struct MemedPhoto{
    
    let topText: String
    let bottomText: String
    let originalImage: UIImage
    var memedImage: UIImage?
    
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedPhoto: UIImage? ) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedPhoto
    }
    
    static var memeArray = [MemedPhoto]()
}
