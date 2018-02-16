//
//  TableViewCell.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 13.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
       super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = self.textLabel?.font.withSize(40)
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
