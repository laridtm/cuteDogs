//
//  AppDelegate.swift
//  cuteDogs
//
//  Created by Larissa Diniz on 19/08/20.
//  Copyright © 2020 Larissa Diniz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let provider = NetworkAdapter()
        let viewController = ViewController()
        viewController.networkProvider = provider
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

    


}

