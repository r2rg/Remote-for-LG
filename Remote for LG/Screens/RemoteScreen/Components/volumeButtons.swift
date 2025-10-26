import SwiftUI
import WebOSClient

extension RemoteView {
    var volumeButtons: some View {
        GlassEffectContainer(spacing: 50) {
            VStack {
                Button {
                    service?.client?.send(.volumeUp)
                } label: {
                    Image(systemName: "plus")
                        .remoteButtonStyle()
                }
                
                Button {
                    service?.client?.send(.volumeDown)
                } label: {
                    Image(systemName: "minus")
                        .remoteButtonStyle()
                }
            }
        }
        .padding()
    }
}
