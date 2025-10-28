//
//  RemoteView+numPad.swift
//  Remote for LG
//
//  Created by Артур Галустян on 28.10.2025.
//

import SwiftUI
import WebOSClient

extension RemoteView {
    var numPad: some View {
        VStack(spacing: 15) {
            HStack(spacing: 20) {
                Button("1", action: {service?.client?.sendKey(.num1)})
                    .remoteButtonStyle()
                Button("2", action: {service?.client?.sendKey(.num2)})
                    .remoteButtonStyle()
                Button("3", action: {service?.client?.sendKey(.num3)})
                    .remoteButtonStyle()
            }
            HStack(spacing: 20) {
                Button("4", action: {service?.client?.sendKey(.num4)})
                    .remoteButtonStyle()
                Button("5", action: {service?.client?.sendKey(.num5)})
                    .remoteButtonStyle()
                Button("6", action: {service?.client?.sendKey(.num6)})
                    .remoteButtonStyle()
            }
            HStack(spacing: 20) {
                Button("7", action: {service?.client?.sendKey(.num7)})
                    .remoteButtonStyle()
                Button("8", action: {service?.client?.sendKey(.num8)})
                    .remoteButtonStyle()
                Button("9", action: {service?.client?.sendKey(.num9)})
                    .remoteButtonStyle()
            }
            Button("0", action: {service?.client?.sendKey(.num0)})
                .remoteButtonStyle()
        }
        .padding()
        .background(.buttonForeground)
        .clipShape(.rect(cornerRadius: 30))
    }
}
