//
//  CircleViewMemory.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

struct CircleViewMemory: View {
    
    var color1 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color2 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var color3 = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    var hardware: String
    var systemName: String
    var percent: String
    @State var progress1 = 0.0
    @StateObject private var progressMemory = SystemLoadMemory()
    
    var body: some View {
        VStack{
            ZStack {
                Circle()
                    .stroke(lineWidth: 5)
                  //  .background(.thinMaterial)
                    .opacity(0.2)
               //     .padding(10)
                
                Circle()
                    .trim(from:0.0, to: min(progress1, Double(progressMemory.getMemoryUsage()!)))
                    .stroke(AngularGradient(gradient: Gradient(colors: [Color(color1), Color(color2), Color(color3)]), center: .center), style: StrokeStyle(lineWidth: 5 , lineCap: .round, lineJoin: .round))
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.easeInOut(duration: 1.0), value: progress1)
                 //   .padding(10)
                
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
            
            //new
            //Text("\(progressMemory.getMemoryUsage()!.formatted(.percent))")
            
            //old
            //Text("\(formatNumber(Double(progressMemory.getMemoryUsage()!)))")
  
        }
    }
}

struct CircleViewMemory_Previews: PreviewProvider {
    static var previews: some View {
        CircleViewMemory(hardware: "MEM", systemName: "memorychip", percent: "90%", progress1: 0.9)
    }
}
