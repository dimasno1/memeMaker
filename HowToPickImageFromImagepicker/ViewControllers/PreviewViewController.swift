//
//  PreviewViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 2/17/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismissMe))
        gesture.delegate = self
        gesture.direction = .down
        self.view.addGestureRecognizer(gesture)
        self.view.backgroundColor = .white
        imageView.frame = self.view.frame
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissMe(by gestureRecognizer: UISwipeGestureRecognizer){
        switch gestureRecognizer.state {
        case .ended:
            dismiss(animated: true, completion: nil)
        default:
            break
        }
        
    }
}
