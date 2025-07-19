import SwiftUI

struct DetailView: View {
    @Environment(NavigationCoordinator.self) var coordinator
    var id: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail ID: \(id)")
                .font(.largeTitle)

            Button("Go Back") {
//                coordinator.pop()
                coordinator.dismissModal()
            }
        }
        .padding()
    }
}
