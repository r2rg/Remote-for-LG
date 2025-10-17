import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Remote", systemImage: "av.remote") {
                RemoteView()
            }
            
            Tab("TV List", systemImage: "tv.fill") {
                TVListView()
            }
        }
    }
}

#Preview("Light theme") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark theme") {
    ContentView()
        .preferredColorScheme(.dark)
}
