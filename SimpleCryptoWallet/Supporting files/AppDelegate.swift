//
//  AppDelegate.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let isLoggedIn = DataManager.shared.getLoggedIn(key: "loggedIn")
        
        if isLoggedIn {
            let rootNC = UINavigationController(rootViewController: TableViewController())
            window?.rootViewController = rootNC
        } else {
            let rootNC = LoginViewController()
            window?.rootViewController = rootNC
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}


