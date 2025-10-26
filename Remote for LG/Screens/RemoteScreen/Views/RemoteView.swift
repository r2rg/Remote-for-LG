import SwiftUI
import WebOSClient

struct RemoteView: View {
    @Environment(TVManager.self) var tvManager
    @State var service: ConnectionService? = nil

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Button {
                    service?.connect()
                } label: {
                    Text("Connect")
                        .padding()
                        .glassEffect()
                }
                .padding(.top)
                
                Spacer()
                
                HStack {
                    volumeButtons
                    controlButtons
                    channelButtons
                }
                .padding(.top)
                .padding()
                
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.buttonForeground)
                    .padding(25)
                    .gesture(DragGesture()
                        .onChanged({ value in
                            let dragOffset = value.velocity
                            service?.client?.sendKey(.move(dx: Int(dragOffset.width / 20), dy: Int(dragOffset.height / 20)))
                        }))
                
                Spacer()
            }
            .blur(radius: service?.isPromptingForPin == true ? 5 : 0)
            
            if let service, service.isPromptingForPin {
                PinEntryOverlay(service: service)
            }
        }
        .onAppear {
            if service == nil {
                service = ConnectionService(tvManager: tvManager)
            }
        }
        .onChange(of: tvManager.selectedTV) { _, newTV in
            service?.tvManager.selectedTV = newTV
        }
    }
}

#Preview("Light Mode") {
    RemoteView()
        .environment(TVManager())
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    RemoteView()
        .environment(TVManager())
        .preferredColorScheme(.dark)
}
