import SwiftUI

struct RemoteButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60)
            .foregroundStyle(.buttonForeground)
            .glassEffect(.clear.tint(.button).interactive())
    }
}

extension View {
    func remoteButtonStyle() -> some View {
        self.modifier(RemoteButtonStyle())
    }
}
