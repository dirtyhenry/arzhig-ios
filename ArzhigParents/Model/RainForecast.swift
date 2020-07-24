import Foundation

struct RainForecast {
    let localizedTime: String
    let localizedDescription: String
    let rainProbabilityScore: RainProbabilityScore

    static let sampleData: [RainForecast] = [
        RainForecast(
        localizedTime: "16h30",
        localizedDescription: "Pas de précipitations",
        rainProbabilityScore: .level1
    ), RainForecast(
        localizedTime: "16h35",
        localizedDescription: "Risque de pluie",
        rainProbabilityScore: .level2
    )]
    
    /// ☀️🌤⛅️🌥☁️🌧⛈🌩🌨❄️"
    var emoji: String {
        return rainProbabilityScore.emoji
    }
}

extension RainForecast: Identifiable {
    var id: String {
        return localizedTime
    }
}

extension RainForecast: Hashable {
    
}

enum RainProbabilityScore: Int, CaseIterable, Codable, Hashable {
    case level1 = 1
    case level2 = 2
    case level3 = 3
    case level4 = 4
    case level5 = 5
    
    /// ☀️🌤⛅️🌥☁️🌧⛈🌩🌨❄️"
    var emoji: String {
        switch self {
        case .level1:
            return "☀️"
        case .level2:
            return "🌤"
        case .level3:
            return "⛅️"
        case .level4:
            return "☁️"
        case .level5:
            return "🌧"
        default:
            return "🤷‍♂️"
        }
    }
}
