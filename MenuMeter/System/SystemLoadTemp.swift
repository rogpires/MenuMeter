//
//  SystemLoadTemp.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 20/07/23.
//

// https://github.com/DanielStormApps/Fanny

import Foundation

final class SystemLoadTemp: ObservableObject {
    
    func getCPUtemperature() -> String {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["powermetrics", "--samplers", "smc"]
        let pipe = Pipe()
        task.standardOutput = pipe
        task.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: String.Encoding.utf8)!
        let pattern = "CPU die temperature: [0-9]+.[0-9]+ C"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let matches = regex.matches(in: output, options: [], range: NSRange(location: 0, length: output.utf16.count))
        if let match = matches.first {
            let range = match.range(at: 0)
            let start = output.index(output.startIndex, offsetBy: range.location + 22)
            let end = output.index(start, offsetBy: 5)
            let temperature = output[start..<end]
            return String(temperature)
        }
        return "Temperature not found"
    }

   // print(getCPUtemperature())
    
//    func getTemperature() -> Double {
//        let task = Process()
//        task.launchPath = "/usr/bin/env/"
//        task.arguments = ["istats", "cpu", "--value-only"]
//
//        let pipe = Pipe()
//        task.standardOutput = pipe
//        task.launch()
//
//        let data = pipe.fileHandleForReading.readDataToEndOfFile()
//        let output = String(data: data, encoding: String.Encoding.utf8)
//
//        if let temperature = Double(output ?? "") {
//            print(temperature)
//            return temperature
//        } else {
//            return 0
//        }
//    }
}


//if let temperature = getTemperature() {
//    print("The processor temperature is \(temperature)°C")
//} else {
//    print("Unable to retrieve processor temperature")
//}
