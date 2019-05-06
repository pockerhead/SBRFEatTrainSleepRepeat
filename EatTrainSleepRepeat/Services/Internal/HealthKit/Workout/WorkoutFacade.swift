//
//  StepsFacade.swift
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation


@objc class WorkoutFacade: NSObject {
    
    @objc public var stepsValue: NSNumber?
    @objc public var stepsStringValue: String {
        return "\(stepsValue == nil ? "-" : String(stepsValue!.intValue))"
    }
    
    @objc public func requestValuesWithCompletion(_ completion: (() -> Void)?) {
        let group = DispatchGroup()
        group.enter()
        HealthService.sharedInstance().getDailyValue(forQuantityType: .stepCount) { (value, err) in
            guard let value = value else { return }
            self.stepsValue = value;
            group.leave()
        }
        group.notify(queue: DispatchQueue.main) {
            completion?()
        }
    }
}
