import Foundation

enum AppRoute: Hashable, Codable {
    case home
    case detail(id: Int)
    case settings
    case settingsDetail
}

extension AppRoute: Identifiable {
    var id: String {
        switch self {
        case .home: "home"
        case let .detail(id): "details-\(id)"
        case .settings: "settings"
        case .settingsDetail: "settingsDetail"
        }
    }
}
