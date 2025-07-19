import SwiftUI

struct HomeView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)

            Button("Go to Detail (ID: 42)") {
                coordinator.push(.detail(id: 42))
            }

            Button("Present Detail Fullscreen") {
                coordinator.presentModal(.detail(id: 99))
            }

            Button("Go to Settings") {
                coordinator.push(.settings)
            }
        }
    }
}
