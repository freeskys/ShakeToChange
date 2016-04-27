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
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var currentEnvironment: Bool = false
        
        if let savedEnvironment: Bool = userDefaults.objectForKey(objectKey) as? Bool {
            currentEnvironment = savedEnvironment
        } else {
            userDefaults.setBool(false, forKey: objectKey)
            currentEnvironment = false
        }
        
        return currentEnvironment
    }
    
    /**
     Handle shake event.
     
     - parameter currentViewController: currentViewController Current active view controller
     */
    static func handleShake(currentViewController: UIViewController) {
        let deviceModel: String = UIDevice.currentDevice().name
        print("CURRENT DEVICE MODEL: \(deviceModel)")
        
        // Don't run this check on Simulator
        if deviceModel != "iPhone Simulator" {
            // Don't show alert when openned on App Store Build
            guard let _: String = NSBundle.mainBundle().pathForResource("embedded", ofType: "mobileprovision") else {
                // This is app store build. Break the function
                return
            }
        }
    
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        // Initialize alert
        let alertTitle: String = "Current Environment: \(ShakeToChange.currentEnvironment() ? "Production" : "Development")"
        
        let alert = UIAlertController(title: alertTitle,
                                      message: nil,
                                      preferredStyle: .ActionSheet)
        
        let devAction = UIAlertAction(title: "Development",
                                      style: .Default,
                                      handler: { (action: UIAlertAction) in
                                        userDefaults.setBool(false, forKey: objectKey)
        })
        let prodAction = UIAlertAction(title: "Production",
                                       style: .Default,
                                       handler: { (action: UIAlertAction) in
                                        userDefaults.setBool(true, forKey: objectKey)
        })
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .Cancel,
                                         handler: nil)
        
        // Add button to alert
        alert.addAction(devAction)
        alert.addAction(prodAction)
        alert.addAction(cancelAction)
        
        // Show alert
        currentViewController.presentViewController(alert, animated: true, completion: nil)
    }
    
}