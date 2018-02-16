//
//  TabBarController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 12.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{
    
    var viewcontr1: NavigationViewController?
    var viewcontr2: NavigationViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TableView and CollectionView instantiations
        let newTable = TableViewController()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: self.view.frame.width/2 - layout.sectionInset.left * 2, height: self.view.frame.width/2 - layout.sectionInset.left * 2)
        let newCollection = CollectionViewController(collectionViewLayout: layout)
        self.tabBar.barStyle = .black
        
        //MARK: Navigation controllers
        let vc1 = NavigationViewController()
//        let imageForItem = UIBarButtonSystemItem.
        let barItemOne = UITabBarItem(title: "CollectionView", image: nil, selectedImage: nil)
        vc1.tabBarItem = barItemOne
        vc1.viewControllers.append(newCollection)
        self.viewcontr1 = vc1
        
        let vc2 = NavigationViewController()
        let barItemTwo = UITabBarItem(title: "TableView", image: nil, selectedImage: nil)
        vc2.tabBarItem = barItemTwo
        vc2.viewControllers.append(newTable)
        self.viewcontr2 = vc2
        
        self.viewControllers = [vc2, vc1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}
