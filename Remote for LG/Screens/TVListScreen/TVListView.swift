import SwiftUI

struct TVListView: View {
    @Environment(TVManager.self) var tvManager
    @State private var isPresentingAddTV = false

    var body: some View {
        NavigationView {
            List() {
                Section("All TVs") {
                    if tvManager.tvList.isEmpty {
                        HStack {
                            ProgressView()
                            Text("Loading TVs...")
                        }
                    } else {
                        ForEach(tvManager.tvList, id: \.self) { tv in
                            Label(tv.name, systemImage: "tv")
                                .onTapGesture {
                                    tvManager.selectedTV = tv
                                }
                                .foregroundStyle(
                                    tvManager.selectedTV == tv ? Color.blue : Color.gray
                                )
                        }
                        .onDelete(perform: tvManager.removeTV)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "plus") {
                        isPresentingAddTV = true
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddTV) {
                AddTVView()
            }
        }
    }
}

#Preview {
    TVListView()
        .environment(TVManager())
}
