//
//  ViewModel.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    
    @Published var vm: [ViewModel] = []
    
    ///Monitor CPU
    var loadMonitor = SystemLoadMonitor()
}

//function for percent formater
func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 1
    return formatter.string(for: number) ?? ""
}
