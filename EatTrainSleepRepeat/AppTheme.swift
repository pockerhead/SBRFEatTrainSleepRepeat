//
//  AppTheme.swift
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 09/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import UIKit
import Foundation


enum AppTheme: Int {
    case dark
    case light
}

extension UIColor {
    @objc public static var mainOrange: UIColor {
        return UIColor.colorWithHexString("FD8C5C")
    }
    
    @objc public static var mainGreen: UIColor {
        return UIColor.colorWithHexString("6AB447")
    }
    
}


