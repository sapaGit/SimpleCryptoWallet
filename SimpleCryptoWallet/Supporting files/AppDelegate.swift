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
            let rootNC = UINavigationController(rootViewController: LoginViewController())
            window?.rootViewController = rootNC
            window?.makeKeyAndVisible()

            return true
        }
    func switchViewControllers() {
        
        // switch root view controllers
        let navigationController = UINavigationController(rootViewController: TableViewController())
        self.window?.rootViewController = navigationController
        
    }
     
    func switchBack() {
        
        // switch back to view controller 1
        let rootNC = UINavigationController(rootViewController: LoginViewController())
        self.window?.rootViewController = rootNC
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
