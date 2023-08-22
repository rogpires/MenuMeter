//
//  BateryView.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

struct BateryView: View {
    
    @Binding var progress: Double
    let fill: Color
    let outline: Color
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Image(systemName: "battery.0")
                .resizable()
                .scaledToFit()
                .font(.headline.weight(.ultraLight))
                .background(
                    Rectangle()
                        .fill(fill)
                        .scaleEffect(x: progress, y: 1, anchor: .leading)
                )
                .mask(
                    Image(systemName: "battery.100")
                        .resizable()
                        .font(.headline.weight(.ultraLight))
                        .scaledToFit()
                )
                .frame(width: 200)
                .padding()
            
            Text("\(Int(self.progress * 100))%")
                .animation(nil)
                .opacity(opacity)
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation {
                    self.opacity = 1
                }
            }
        }
    }
}

struct BateryView_Previews: PreviewProvider {
    static var previews: some View {
        BateryView(progress: .constant(0.7), fill: .green, outline: .black)
    }
}
