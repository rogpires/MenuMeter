//
//  SystemLoadBatery.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import Foundation
import IOKit.ps

final class SystemLoadBatery: ObservableObject {
    func getBatteryPercentage() -> Double? {
        let snapshot = IOPSCopyPowerSourcesInfo()?.takeRetainedValue()
        let sources = IOPSCopyPowerSourcesList(snapshot)?.takeRetainedValue() as? [CFTypeRef]
        
        if let sources = sources {
            for source in sources {
                let info = IOPSGetPowerSourceDescription(snapshot, source)?.takeUnretainedValue() as? [String: Any]
                
                if let currentCapacity = info?[kIOPSCurrentCapacityKey] as? Int,
                   let maxCapacity = info?[kIOPSMaxCapacityKey] as? Int {
                    let percentage = (Double(currentCapacity) / Double(maxCapacity)) * 1 // colocar - 0.20 para testar
                   // print(percentage)
                    return percentage
                    
                }
            }
        }
        
        return nil
    }
    
}
