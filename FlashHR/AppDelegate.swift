//
//  AppDelegate.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate{

    var window: UIWindow?
    let loginVC = LoginVC()
    let DS = DepartmentSelection()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        setRootViewController(DS)
        
//        displayLogin()
        return true
    }

}

extension AppDelegate{
    
    private func displayLogin() {
        setRootViewController(loginVC)
    }
    
}


extension AppDelegate{
    
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

