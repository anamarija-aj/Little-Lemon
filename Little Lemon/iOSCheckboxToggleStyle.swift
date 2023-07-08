//
//  iOSCheckboxToggleStyle.swift
//  Little Lemon
//
//  Created by Anamarija Jukic on 08.07.2023..
//

import Foundation
import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                        .foregroundColor(.black)
                    configuration.label
                    Spacer()
                }
            }
        }
    }
}
