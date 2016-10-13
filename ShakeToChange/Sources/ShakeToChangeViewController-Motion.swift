//
//  ShakeToChangeViewController-Motion.swift
//  ShakeToChange
//
//  Created by Harditya on 10/13/16.
//  Copyright © 2016 Blezcode. All rights reserved.
//

import Foundation
import UIKit

extension ShakeToChangeViewController {
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            self.handleShake()
        }
    }
    
}
