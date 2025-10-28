//
//  RemoteView+trackPad.swift
//  Remote for LG
//
//  Created by Артур Галустян on 28.10.2025.
//

import SwiftUI

extension RemoteView {
    var trackPad: some View {
        TrackPadView(service: service)
    }
}
