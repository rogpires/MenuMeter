//
//  SystemLoadMemory.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import Foundation

final class SystemLoadMemory: ObservableObject {

    func getMemoryUsage() -> Double? {
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        let kerr: kern_return_t = withUnsafeMutablePointer(to: &info) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
            }
        }

        guard kerr == KERN_SUCCESS else { return nil }
        let bytes = Double(info.resident_size)
        let totalBytes = Double(ProcessInfo.processInfo.physicalMemory)
        let percentage = bytes / totalBytes * 100
        print(percentage)
        return percentage
    }
    
}
