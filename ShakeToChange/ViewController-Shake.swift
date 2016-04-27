//
//  ViewController-Shake.swift
//  ShakeToChange
//
//  Created by harditya on 4/12/16.
//  Copyright © 2016 Blezcode. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            ShakeToChange.handleShake(self)
        }
    }
    
}