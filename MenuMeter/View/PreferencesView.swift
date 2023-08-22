//
//  PreferencesView.swift
//  MenuMeter
//
//  Created by Rogerio Pires on 17/07/23.
//

import SwiftUI

struct PreferencesView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image("MenuMeter")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("MenuMeter")
                    .font(.title3)
                Text("Copyright @2023 - Rogerio Pires")
                Text("https://bento.me/rogeriopires")
                Text("Version 1.0.5")
            }
            .font(.caption)
            .padding()
        }.frame(width: 200, height: 140)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
