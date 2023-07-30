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
                Text("MenuMeter")
                    .font(.title3)
                Text("Copyright @2023 - Rogerio Pires")
                Text("https://bento.me/rogeriopires")
                Text("Version 1.0.4")
            }
            .font(.caption)
            .padding()
        }.frame(width: 200, height: 100)
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView()
    }
}
