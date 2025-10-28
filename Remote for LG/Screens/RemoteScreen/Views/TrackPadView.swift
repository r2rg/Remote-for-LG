//
//  TrackPadView.swift
//  Remote for LG
//
//  Created by Артур Галустян on 28.10.2025.
//

import SwiftUI
import WebOSClient

struct TrackPadView: View {
    @State var service: ConnectionService?
    @State var dragOffset = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundStyle(.buttonForeground)
            .gesture(DragGesture()
                .onChanged({ value in
                    dragOffset = value.velocity
                    service?.client?.sendKey(.move(dx: Int(dragOffset.width / 20), dy: Int(dragOffset.height / 20)))
                }))
            .onTapGesture {
                service?.client?.sendKey(.click)
            }
            .sensoryFeedback(.impact(flexibility: .soft, intensity: 0.3), trigger: dragOffset)
            .padding(25)    }
}
