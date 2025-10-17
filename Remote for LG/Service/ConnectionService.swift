import Foundation
import WebOSClient

fileprivate enum Constants {
    static let registrationTokenKey = "clientKey"
}

@Observable
final class ConnectionService: WebOSClientDelegate {
    let tvManager: TVManager

    var client: WebOSClient? // <--- Changed from 'private' to internal (default)
    private(set) var isPromptingForPin = false
    var enteredPin: String = "" // Bind this to your TextField in SwiftUI

    init(tvManager: TVManager) {
        self.tvManager = tvManager
    }

    func connect() {
        guard
            let tv = tvManager.selectedTV,
            let url = URL(string: "wss://\(tv.ip):3001")
        else {
            return
        }

        // Hold onto the client and set delegate
        let client = WebOSClient(url: url, delegate: self, shouldLogActivity: true)
        self.client = client
        client.connect()

        // On initial connection, use clientKey if available
        let registrationToken = UserDefaults.standard.string(forKey: Constants.registrationTokenKey)
        client.send(.register(pairingType: .pin, clientKey: registrationToken))
    }

    // Call this from your UI when the user submits the PIN
    func submitPin() {
        guard let client = client, !enteredPin.isEmpty else { return }
        client.send(.setPin(enteredPin))
        // Hide the PIN entry UI until we know if it succeeded
        isPromptingForPin = false
    }

    // MARK: - WebOSClientDelegate

    func didDisplayPin() {
        // Called when the TV shows a pin (user should enter it)
        isPromptingForPin = true
        enteredPin = ""
    }

    func didRegister(with clientKey: String) {
        // Successfully paired, store the key
        UserDefaults.standard.set(clientKey, forKey: Constants.registrationTokenKey)
    }

    func didReceiveNetworkError(_ error: Error?) {
        // Handle disconnect/retry as needed
        isPromptingForPin = false
    }

    // Optional: implement other delegate methods as needed
}
