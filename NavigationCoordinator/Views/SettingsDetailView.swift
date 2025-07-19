import SwiftUI

struct SettingsDetailView: View {
    @Environment(NavigationCoordinator.self) var coordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)

            Button("Back to Settings") {
                coordinator.dismissModal()
            }
        }
        .padding()
    }
}
