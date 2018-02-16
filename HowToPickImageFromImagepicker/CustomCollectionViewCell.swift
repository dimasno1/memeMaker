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
        let newSize = self.contentView.frame.size.applying(CGAffineTransform(scaleX: scale, y: scale))
        let originXOffset = (self.frame.width - newSize.width)/2
        print(self.contentView.frame.size, newSize)
//        let newPoint = CGPoint(x: originXOffset, y: self.frame.minY)
        let newFrame = self.frame.offsetBy(dx: originXOffset, dy: 0)
        imageView.frame.size = newSize
        imageView.frame = newFrame
        self.contentView.addSubview(imageView)
        self.imageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
