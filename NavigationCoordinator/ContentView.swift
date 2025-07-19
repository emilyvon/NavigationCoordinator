//
//  ContentView.swift
//  NavigationCoordinator
//
//  Created by Mengying Feng on 19/7/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var coordinator = NavigationCoordinator()
    @Environment(\.scenePhase) private var scenePhase
    @State private var isModal = false

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeView()
                    case let .detail(id):
                        DetailView(id: id)
                    case .settings:
                        SettingsView()
                    case .settingsDetail:
                        SettingsDetailView()
                    }
                }
                .fullScreenCover(item: $coordinator.modalRoute) { route in
                    switch route {
                    case let .detail(id):
                        DetailView(id: id)
                    case .settingsDetail:
                        SettingsDetailView()
                    case .home,
                            .settings:
                        EmptyView()
                    }
                }
        }
        .environment(coordinator)
        .onChange(of: scenePhase) { oldState, newState in
            if newState == .background {
                coordinator.savePath()
            }
        }
    }
}

#Preview {
    ContentView()
}
