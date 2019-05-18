//
//  StepsFacade.swift
//  EatTrainSleepRepeat
//
//  Created by pockerhead on 07/05/2019.
//  Copyright © 2019 pockerhead. All rights reserved.
//

import Foundation


@objc class WorkoutFacade: NSObject {
    
    @objc public func updateValuesWithCompletion(_ completion: (() -> Void)?) {
        let group = DispatchGroup()
        group.enter()
        HealthService.sharedInstance().getDailyValue(forQuantityType: .stepCount) { (value, err) in
            if let value = value {
                self.stepsValue = value
            }
            group.leave()
        }
        group.enter()
        HealthService.sharedInstance().getDailyValue(forQuantityType: .distanceWalkingRunning) { (value, err) in
            if let value = value {
                self.distanceValue = value
            }
            group.leave()
        }
        
        group.enter()
        HealthService.sharedInstance().getDailyValue(forQuantityType: .activeEnergyBurned) { (value, err) in
            guard let activeEnergyValue = value else {
                group.leave()
                return
            }
            HealthService.sharedInstance().getDailyValue(forQuantityType: .basalEnergyBurned, completion: { (value, err) in
                guard let basalEnergyValue = value else {
                    group.leave()
                    return
                }
                self.overallEnergyBurnedValue = NSNumber(value: activeEnergyValue.intValue + basalEnergyValue.intValue)
                group.leave()
            })
        }
        
        group.notify(queue: DispatchQueue.main) {
            completion?()
        }
    }
    
    @objc public var stepsValue: NSNumber?
    @objc public var stepsStringValue: String {
        return "\(stepsValue == nil ? "-" : String(stepsValue!.intValue))"
    }
    
    @objc public var distanceValue: NSNumber?
    @objc public var distanceStringValue: String {
        guard let distanceValue = distanceValue else { return "-" }
        var string: String = "\(String.init(format: "%.3f км.", distanceValue.floatValue / 1000))"
        if distanceValue.floatValue / 1000 > 1.3 {
            string = "\(String.init(format: "%.1f км.", distanceValue.floatValue / 1000))"
        } else if distanceValue.floatValue / 1000 > 1.1 {
            string = "\(String.init(format: "%.2f км.", distanceValue.floatValue / 1000))"
        } else if distanceValue.floatValue / 1000 < 1 {
            string = "\(distanceValue.intValue) м."
        }
        return string
    }
    
    @objc public var overallEnergyBurnedValue: NSNumber?
    @objc public var overallEnergyBurnedStringValue: String {
        return "\(overallEnergyBurnedValue == nil ? "-" : "\(overallEnergyBurnedValue!) кКал")"
    }
    
}
