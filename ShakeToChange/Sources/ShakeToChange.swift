//
//  ShakeToChange.swift
//  ShakeToChange
//
//  Created by harditya on 4/27/16.
//  Copyright © 2016 Blezcode. All rights reserved.
//

import Foundation
import UIKit

class ShakeToChange {
    
    static let objectKey = "DEVELOPMENT_ENVIRONMENT"
    static let isProduction = true
    static let isDevelopment = false
    
    /**
     Get current development environment.
     Production == TRUE || Development == FALSE
     
     - returns: Bool Current environment
     */
    static func currentEnvironment() -> Bool {
        let userDefaults = UserDefaults.standard
        var currentEnvironment: Bool = false
        
        if let savedEnvironment: Bool = userDefaults.object(forKey: objectKey) as? Bool {
            currentEnvironment = savedEnvironment
        } else {
            userDefaults.set(false, forKey: objectKey)
            currentEnvironment = false
        }
        
        return currentEnvironment
    }
    
    /**
     Handle shake event.
     
     - parameter currentViewController: currentViewController Current active view controller
     */
    static func handleShake(_ currentViewController: UIViewController) {
        let deviceModel: String = UIDevice.current.model
        let systemName: String = UIDevice.current.systemName
        print("DETECTING CURRENT DEVICE MODEL = \(deviceModel)")
        
        // Don't run this check on Simulator
        if deviceModel != "iPhone Simulator" {
            print("SIMULATOR NOT DETECTED")
            
            // Don't show alert when openned on App Store Build
//            guard Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" else {
//                // This is app store build. Break the function
//                print("APP STORE BUILD DETECTED")
//                return
//            }
        } else {
            print("SIMULATOR DETECTED")
        }
    
        showEnvironmentSheet(currentViewController)
    }
    
    /**
     Show the environment sheet.
     
     - parameter currentViewController: currentViewController Current active view controller
     */
    static func showEnvironmentSheet(_ currentViewController: UIViewController) {
        // User defaults
        let userDefaults = UserDefaults.standard
        
        // Initialize alert
        let alertTitle: String = "Current Environment: \(ShakeToChange.currentEnvironment() ? "Production" : "Development")"
        
        let alert = UIAlertController(title: alertTitle,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        let devAction = UIAlertAction(title: "Development",
                                      style: .default,
                                      handler: { (action: UIAlertAction) in
                                        userDefaults.set(false, forKey: objectKey)
        })
        let prodAction = UIAlertAction(title: "Production",
                                       style: .default,
                                       handler: { (action: UIAlertAction) in
                                        userDefaults.set(true, forKey: objectKey)
        })
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel,
                                         handler: nil)
        
        // Add button to alert
        alert.addAction(devAction)
        alert.addAction(prodAction)
        alert.addAction(cancelAction)
        
        // Show alert
        currentViewController.present(alert, animated: true, completion: nil)
        print("SHOWING ACTION SHEET")
    }
    
}

extension UIViewController {
    
    /**
     Handle shake event.
     */
    func handleShake() {
        ShakeToChange.handleShake(self)
    }
    
}
