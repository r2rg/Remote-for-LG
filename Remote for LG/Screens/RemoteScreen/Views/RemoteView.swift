import SwiftUI
import WebOSClient

struct RemoteView: View {
    @Environment(TVManager.self) var tvManager
    @State var service: ConnectionService

    init() {
        _service = State(initialValue: ConnectionService(tvManager: TVManager()))
    }

    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
                Button {
                    service.connect()
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
                    .onTapGesture { location in
                        print("\(location)")
                    }
                
                Spacer()
            }
            .blur(radius: service.isPromptingForPin ? 5 : 0)
            
            if service.isPromptingForPin {
                PinEntryOverlay(service: service)
            }
        }
        .onChange(of: tvManager.selectedTV) { _, newTV in
            service.tvManager.selectedTV = newTV
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
