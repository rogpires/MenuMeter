//
//  CircleViewCpu.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

struct CircleViewCpu: View {
    
    var color1 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color2 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color3 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var hardware: String
    var systemName: String
    var percent: String
    @State var progress0 = 0.0
    @StateObject private var progressCpu = SystemLoadMonitor()
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                    .opacity(0.2)
                
                Circle()
                    .trim(from:0.0, to: min(progress0, Double(progressCpu.currentLoad)))
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color(color1), Color(color2), Color(color3)]), center: .center), style: StrokeStyle(lineWidth: 5 , lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 1.0), value: progress0)
                
                VStack(spacing: 30){
                    VStack(spacing: 3){
                        Image(systemName: systemName)
                            .opacity(0.7)
                            .font(.system(size: 16))
                        Text(hardware)
                            .font(.system(size: 08))
                    }
                }
            }
            
            //Text("\(formatNumber(Double(progressCpu.currentLoad)))")
            
        }
    }
}

struct CircleViewCpu_Previews: PreviewProvider {
    static var previews: some View {
        CircleViewCpu(hardware: "CPU", systemName: "cpu", percent: "90%", progress0: 0.9)
    }
}
