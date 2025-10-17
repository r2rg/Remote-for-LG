import SwiftUI

struct PinEntryOverlay: View {
    @Bindable var service: ConnectionService

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter the PIN shown on your TV")
                .font(.headline)
                .padding()
            TextField("PIN", text: $service.enteredPin)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .multilineTextAlignment(.center)
                .frame(width: 150)
            Button("Submit PIN") {
                service.submitPin()
            }
            .buttonStyle(.borderedProminent)
            .disabled(service.enteredPin.isEmpty)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 10)
        .frame(maxWidth: 300)
    }
}
