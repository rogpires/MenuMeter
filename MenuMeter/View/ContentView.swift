//
//  ContentView.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI
import Cocoa
import AppKit

struct ContentView: View {
    
    @StateObject private var vm: ViewModel
    @State private var progress = 0.0
    @StateObject private var progressCpu = SystemLoadMonitor()
    @StateObject private var progressMemory = SystemLoadMemory()
    @StateObject private var progressDisk = SystemLoadDisk()
    @StateObject private var progressBatery = SystemLoadBatery()
    @StateObject private var progressTemp = SystemLoadTemp()
    @State private var isShowPreferences: Bool = false
    var progress0 = 0.0
    var progress1 = 0.0
    var progress2 = 0.0
    
    init(vm: ViewModel) {
        self._vm = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                //MARK: -- Create ProgressRigBatery
                VStack{
                    CircleViewBatery(hardware: "BATTERY", systemName: "battery.0", percent: "90%", progress4: 1.0)
                }
                .frame(width: 60, height: 60)
                Spacer()
                
                //MARK: -- Create ProgressRigCPU
                VStack{
                    CircleViewCpu(hardware: "CPU", systemName: "cpu", percent: "90%", progress0: 1.0)
                }
                .frame(width: 60, height: 60)
                Spacer()
                
                //MARK: -- Create ProgressRigMEM
                VStack {
                    //    Text("Memory usage: \(getMemoryUsage() ?? 0) bytes")
                    CircleViewMemory(hardware: "MEM", systemName: "memorychip", percent: "60%", progress1: 1.0)
                }
                .frame(width: 60, height: 60)
                Spacer()
                
                //MARK: -- Create ProgressRigDISK
                VStack {
                    CircleViewDisk(hardware: "DISK", systemName: "internaldrive", percent: "40%", progress2: 1.0)
                }
                .frame(width: 60, height: 60)
                
            }
            
            //MARK: -- Line
            Rectangle()
                .frame(height: 1)
                .opacity(0.2)
                .padding(6)
            
            //MARK: -- Create Button Quit and Preferences
            HStack {
                Button(action: {
                    isShowPreferences = true
                }) {
                    Text("About")
                }
                .buttonStyle(.plain)
                .opacity(0.8)
                .popover(isPresented: $isShowPreferences) {
                    PreferencesView()
                }
                
                Spacer()
                
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                    Text("Quit")
                }
                .buttonStyle(.plain)
                .opacity(0.8)
            }
        }
        .frame(width: 280, height: 100)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }
}
