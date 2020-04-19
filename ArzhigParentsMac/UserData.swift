import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var sampleData = RainForecast.sampleData
    @Published var profile = Profile.default
}
