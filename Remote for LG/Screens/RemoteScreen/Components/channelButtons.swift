import SwiftUI
import WebOSClient

extension RemoteView {
    var channelButtons: some View {
        GlassEffectContainer(spacing: 50) {
            VStack {
                Button {
                    service.client?.send(.channelUp)
                } label: {
                    Image(systemName: "chevron.up")
                        .remoteButtonStyle()
                }
                
                Button {
                    service.client?.send(.channelDown)
                } label: {
                    Image(systemName: "chevron.down")
                        .remoteButtonStyle()
                }
            }
        }
        .padding()
    }
}
