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
        MenuBarExtra("MenuMeter", systemImage: "cpu") {
            ZStack {
                ContentView(vm: ViewModel())
            }
        //    .frame(width: 420, height: 160)
            .background(.thinMaterial)
        }.menuBarExtraStyle(.window)
    }
}
