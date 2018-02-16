//
//  NavigationViewController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 2/16/18.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.topItem?.title = "Sent memes"
        self.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presentAddController))
        self.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: nil)
        self.navigationBar.barStyle = .black
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func presentAddController(){
        let viewControllerToPresent = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newViewController")
        self.present(viewControllerToPresent, animated: true, completion: nil)
    }
    
}
