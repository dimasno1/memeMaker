//
//  CollectionViewCell.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 2/14/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    var image: UIImage?
    
    override init(frame: CGRect){
        super.init(frame: frame)

        let scale = CGFloat(0.75)
//        imageView.image?.scale = scale
        let newSize = self.contentView.frame.size.applying(CGAffineTransform(scaleX: scale, y: scale))
        let originXOffset = (self.frame.width - newSize.width)/2
        print(self.contentView.frame.size, newSize)
//      
        var newFrame = self.contentView.frame.offsetBy(dx: originXOffset, dy: originXOffset)
        newFrame.size = newSize
        imageView.frame = newFrame
        imageView.contentMode = .scaleAspectFit
        self.contentView.addSubview(imageView)
        self.imageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
