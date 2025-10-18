import Foundation
import WebOSClient

fileprivate enum Constants {
    static let registrationTokenKey = "clientKey"
}

@Observable
final class ConnectionService: WebOSClientDelegate {
    let tvManager: TVManager

    var client: WebOSClient?
    private(set) var isPromptingForPin = false
    var enteredPin: String = ""

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

        let client = WebOSClient(url: url, delegate: self, shouldLogActivity: true)
        self.client = client
        client.connect()

        let registrationToken = UserDefaults.standard.string(forKey: Constants.registrationTokenKey)
        client.send(.register(pairingType: .pin, clientKey: registrationToken))
    }

    func submitPin() {
        guard let client = client, !enteredPin.isEmpty else { return }
        client.send(.setPin(enteredPin))
        isPromptingForPin = false
    }


    func didDisplayPin() {
        isPromptingForPin = true
        enteredPin = ""
    }

    func didRegister(with clientKey: String) {
        UserDefaults.standard.set(clientKey, forKey: Constants.registrationTokenKey)
    }

    func didReceiveNetworkError(_ error: Error?) {
        isPromptingForPin = false
    }
}
