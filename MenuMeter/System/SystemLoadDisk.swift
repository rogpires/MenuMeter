//
//  SystemLoadDisk.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import Foundation

final class SystemLoadDisk: ObservableObject {
   
    func freeDiskSpace() -> Double {
            let fileManager = FileManager.default
            do {
                let systemAttributes = try fileManager.attributesOfFileSystem(forPath: "/")
                if let freeSize = systemAttributes[.systemFreeSize] as? NSNumber,
                   let totalSize = systemAttributes[.systemSize] as? NSNumber {
                    let freeDiskSpaceInBytes = freeSize.int64Value
                    let totalDiskSpaceInBytes = totalSize.int64Value
                    
                    let freeDiskSpaceInPercentage = (Double(freeDiskSpaceInBytes) / Double(totalDiskSpaceInBytes))
                   print(freeDiskSpaceInPercentage)
                    return freeDiskSpaceInPercentage
                }
            } catch {
                print("Erro ao obter espaço livre no disco: \(error.localizedDescription)")
            }
            
            return 0.0
        }
    
    func usedDiskSpace() -> Double {
           let fileManager = FileManager.default
           do {
               let systemAttributes = try fileManager.attributesOfFileSystem(forPath: "/")
               if let totalSize = systemAttributes[.systemSize] as? NSNumber,
                  let freeSize = systemAttributes[.systemFreeSize] as? NSNumber {
                   let totalDiskSpaceInBytes = totalSize.int64Value
                   let freeDiskSpaceInBytes = freeSize.int64Value
                   
                   let usedDiskSpaceInBytes = totalDiskSpaceInBytes - freeDiskSpaceInBytes
                   let usedDiskSpaceInPercentage = (Double(usedDiskSpaceInBytes) / Double(totalDiskSpaceInBytes))
                   
                   return usedDiskSpaceInPercentage
               }
           } catch {
               print("Erro ao obter espaço utilizado no disco: \(error.localizedDescription)")
           }
           
           return 0.0
       }
    
    
}

