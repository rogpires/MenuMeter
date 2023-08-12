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
            ZStack {
                HStack {
                    
                    //MARK: -- Create ProgressRigBatery
                    VStack{
                        ZStack {
                            CircleViewBatery(hardware: "BATTERY", systemName: "battery.0", percent: "90%", progress4: 1.0)
                        }
                    }
                    
                    //MARK: -- Create ProgressRigCPU
                    VStack{
                        ZStack {
                            CircleViewCpu(hardware: "CPU", systemName: "cpu", percent: "90%", progress0: 1.0)
                        }
                    }
                    
                    //MARK: -- Create ProgressRigMEM
                    VStack {
                        ZStack {
                            //    Text("Memory usage: \(getMemoryUsage() ?? 0) bytes")
                            CircleViewMemory(hardware: "MEM", systemName: "memorychip", percent: "60%", progress1: 1.0)
                        }
                    }
                    
                    //MARK: -- Create ProgressRigDISK
                    VStack {
                        ZStack {
                            CircleViewDisk(hardware: "DISK", systemName: "internaldrive", percent: "40%", progress2: 1.0)
                        }
                    }
                    
                }
            }//.padding()
            
            //MARK: -- Line
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.black)
                .opacity(0.2)
                .padding(6)
            
            //MARK: -- Create Button Quit and Preferences
            HStack {
                Button(action: {
                    isShowPreferences = true
                }) {
                 //   Image(systemName: "gear")
                  //  Image(systemName: "slider.vertical.3")
                      //  .font(.system(size: 20))
                    Text("About")
                }
                .buttonStyle(.plain)
                .opacity(0.8)
               // .padding(.leading, 10)
                .popover(isPresented: $isShowPreferences) {
                    PreferencesView()
                }
                Spacer()
                
             //  Text("\(progressTemp.getCPUtemperature())")
                
                Button(action: {
                    NSApplication.shared.terminate(self)
                }) {
                 //   Image(systemName: "xmark.circle")
                      // .font(.system(size: 20))
                    Text("Quit")
                }
                .buttonStyle(.plain)
                .opacity(0.8)
              //  .padding(.trailing, 10)
            }
        }
        .frame(width: 280, height: 120) //usar 300 por 160 para 3 relogios
        .padding(10)
     //   .background(.thinMaterial)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: ViewModel())
    }
}
