//
//  AppDelegate.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 06.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let rootController = TabBarController()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}

