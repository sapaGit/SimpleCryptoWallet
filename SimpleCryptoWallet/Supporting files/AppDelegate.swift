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
        let isLoggedIn = UserDefaults.standard.value(forKey: "loggedIn") as? Bool ?? false
        
        if isLoggedIn {
        
        let rootNC = UINavigationController(rootViewController: TableViewController())
        
        window?.rootViewController = rootNC
            
        } else {
            let rootNC = UINavigationController(rootViewController: LoginViewController())
            window?.rootViewController = rootNC
        }
            window?.makeKeyAndVisible()

            return true
        }
}

extension UIWindow {
    
    func switchRootViewController(_ viewController: UIViewController,
                                  animated: Bool = true,
                                  duration: TimeInterval = 0.5,
                                  options: AnimationOptions = .transitionFlipFromRight,
                                  completion: (() -> Void)? = nil) {
        guard animated else {
            rootViewController = UINavigationController(rootViewController: viewController)
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = UINavigationController(rootViewController: viewController)
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
    
}
