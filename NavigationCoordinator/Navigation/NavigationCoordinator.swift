import Foundation
import SwiftUI

@Observable class NavigationCoordinator {
    var path = NavigationPath() {
        didSet {
            savePath()
        }
    }
    var modalRoute: AppRoute? = nil

    init() {
        loadPath()
    }

    func push(_ route: AppRoute) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path.removeLast(path.count)
    }

    func presentModal(_ route: AppRoute) {
        modalRoute = route
    }

    func dismissModal() {
        modalRoute = nil
    }

     func savePath() {
        do {
            let data = try JSONEncoder().encode(path.codable)
            UserDefaults.standard.set(data, forKey: "navPath")
        } catch {
            print("Failed to save path: \(error)")
        }
    }

    private func loadPath() {
        guard let data = UserDefaults.standard.data(forKey: "navPath") else { return }
        do {
            let decoded = try JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
            self.path = NavigationPath(decoded)
        } catch {
            print("Failed to load path: \(error)")
        }
    }
}
