import Foundation

struct RainForecast {
    let localizedTime: String
    let localizedDescription: String
    let rainProbabilityScore: Int

    static let sampleData: [RainForecast] = [
        RainForecast(
        localizedTime: "16h30",
        localizedDescription: "Pas de précipitations",
        rainProbabilityScore: 1
    ), RainForecast(
        localizedTime: "16h35",
        localizedDescription: "Risque de pluie",
        rainProbabilityScore: 2
    )]
    
    /// ☀️🌤⛅️🌥☁️🌧⛈🌩🌨❄️"
    var emoji: String {
        switch rainProbabilityScore {
        case 1:
            return "☀️"
        case 2:
            return "🌤"
        case 3:
            return "⛅️"
        case 4:
            return "☁️"
        case 5:
            return "🌧"
        default:
            return "🤷‍♂️"
        }
    }
}

extension RainForecast: Identifiable {
    var id: String {
        return localizedTime
    }
}
