import SwiftUI

struct SettingsView: View {
    @Environment(NavigationCoordinator.self) var coordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Settings")
                .font(.largeTitle)

            Button("Back to Home") {
                coordinator.popToRoot()
            }

            Button("Present settings details") {
                coordinator.presentModal(.settingsDetail)
            }
        }
        .padding()
    }
}
