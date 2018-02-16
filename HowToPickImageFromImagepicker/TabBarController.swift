//
//  TabBarController.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 12.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{

    
    
    var viewcontr1: CollectionViewController?
    var viewcontr2: TableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let vc1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "newViewController")
//        let barItemOne = UITabBarItem(title: "PickImage", image: nil, tag: 0)
//        vc1.tabBarItem = barItemOne
//        self.viewcontr1 = vc1 as? ViewController
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: 75, height: 75)
        let vc1 = CollectionViewController(collectionViewLayout: layout)
        
        
    
        let barItemOne = UITabBarItem(title: "CollectionView", image: nil, selectedImage: nil)
        vc1.tabBarItem = barItemOne
        self.viewcontr1 = vc1
        
        let vc2 = TableViewController()
        let barItemTwo = UITabBarItem(title: "TableView", image: nil, selectedImage: nil)
        vc2.tabBarItem = barItemTwo
        self.viewcontr2 = vc2
        
        
        
        
        
        
        
        
        self.viewControllers = [vc2, vc1]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        switch item.title! {
//        case "PickImage":
//            self.selectedViewController = viewcontr1
//            print("1")
//        case "Results":
//            selectedViewController = viewcontr2
//            print("2")
//        default:
//            break
//        }
//    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
