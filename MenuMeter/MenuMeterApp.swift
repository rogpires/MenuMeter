//
//  MenuMeterApp.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

@main
struct MenuMeterApp: App {
    var body: some Scene {
        MenuBarExtra("MenuMeter", image: "vu") {
            ZStack {
                ContentView(vm: ViewModel())
            }
        }
        .menuBarExtraStyle(.window)
    }
}
