import SwiftUI

struct AddTVView: View {
    @Environment(TVManager.self) private var tvManager

    @State private var name: String = ""
    @State private var location: String = ""
    @State private var ip: String = ""

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
            Section(header: Text("TV Info")) {
                TextField("Name", text: $name)
                TextField("Location", text: $location)
                TextField("IP Address", text: $ip)
                    .keyboardType(.numbersAndPunctuation)
            }
            Section {
                Button("Add TV") {
                    let newTV = TV(name: name, location: location, ip: ip)
                    tvManager.addTV(newTV)
                    dismiss()
                }
                .disabled(name.isEmpty || location.isEmpty || ip.isEmpty)
            }
        }
        .navigationTitle("Add TV")
    }
}

#Preview {
    AddTVView()
        .environment(TVManager())
}
