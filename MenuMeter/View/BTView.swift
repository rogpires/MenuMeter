//
//  BTView.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 22/08/23.
//

import SwiftUI
import CoreBluetooth

struct BTView: View {
    @StateObject private var bluetoothManager = BluetoothManager()
    
    var body: some View {
        NavigationView {
            List(bluetoothManager.devices) { device in
                VStack(alignment: .leading) {
                    Text(device.name)
                        .font(.headline)
                    Text("RSSI: \(device.rssi)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("Bluetooth Devices")
        }
        .onAppear {
            bluetoothManager.startScanning()
        }
    }
}

struct BluetoothDevice: Identifiable {
    let id = UUID()
    let name: String
    let rssi: NSNumber
}

class BluetoothManager: NSObject, ObservableObject, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    @Published var devices: [BluetoothDevice] = []
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func startScanning() {
        if centralManager.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            startScanning()
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if let name = peripheral.name {
            let newDevice = BluetoothDevice(name: name, rssi: RSSI)
            devices.append(newDevice)
        }
    }
}



struct BTView_Previews: PreviewProvider {
    static var previews: some View {
        BTView()
    }
}
