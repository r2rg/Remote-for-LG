import SwiftUI
import WebOSClient

extension RemoteView {
    var controlButtons: some View {
        GlassEffectContainer(spacing: 50) {
            ZStack {
                Circle()
                    .glassEffect(.regular.tint(.buttonForeground))
                
                VStack {
                    Button {
                        service?.client?.sendKey(.up)
                    } label: {
                        Image(systemName: "arrowtriangle.up")
                            .remoteButtonStyle()
                    }
                    
                    HStack {
                        Button {
                            service?.client?.sendKey(.left)
                        } label: {
                            Image(systemName: "arrowtriangle.backward")
                                .remoteButtonStyle()
                        }
                        
                        Button {
                            service?.client?.sendKey(.click)
                        } label: {
                            Image(systemName: "circle")
                                .remoteButtonStyle()
                        }
                        
                        Button {
                            service?.client?.sendKey(.right)
                        } label: {
                            Image(systemName: "arrowtriangle.forward")
                                .remoteButtonStyle()
                        }
                    }
                    
                    Button {
                        service?.client?.sendKey(.down)
                    } label: {
                        Image(systemName: "arrowtriangle.down")
                            .remoteButtonStyle()
                    }
                }
            }
        }
    }
}
