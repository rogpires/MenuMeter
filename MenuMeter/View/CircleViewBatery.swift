//
//  CircleViewBatery.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

struct CircleViewBatery: View {
    
    var color1 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color2 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color3 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var hardware: String
    var systemName: String
    var percent: String
    @State var progress4 = 0.0
    @StateObject private var progressBatery = SystemLoadBatery()
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 6)
                    .foregroundColor(.black)
                    .opacity(0.1)
                    .padding(10)
                
                Circle()
                    .trim(from:0.0, to: min(progress4, Double(progressBatery.getBatteryPercentage()!)))
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color(color1), Color(color2), Color(color3)]), center: .center), style: StrokeStyle(lineWidth: 6 , lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 1.0), value: progress4)
                    .padding(10)
                
                VStack(spacing: 30){
                    VStack(spacing: 3){
                        Image(systemName: systemName)
                            .opacity(0.7)
                            .font(.system(size: 20))
                        Text(hardware)
                            .font(.system(size: 10))
                    }
                }
            }
            
            //Text("\(formatNumber(Double(progressBatery.getBatteryPercentage()!)))")
            
        }
    }
}

struct CircleViewBatery_Previews: PreviewProvider {
    static var previews: some View {
        CircleViewBatery(hardware: "BATERY", systemName: "battery.0", percent: "90%", progress4: 0.9)
    }
}
