import SwiftUI

struct Filter: View {
    @EnvironmentObject private var userData: UserData
    @Binding var filter: FilterType

    var body: some View {
         HStack {
            Picker(selection: $filter, label: EmptyView()) {
                ForEach(FilterType.allCases) { choice in
                    Text(choice.name).tag(choice)
                }
            }
            
            Spacer()
            
             Toggle(isOn: $userData.showFavoritesOnly) {
                 Text("Favorites only")
             }
        }
    }
}

struct Filter_Previews: PreviewProvider {
    static var previews: some View {
        Filter(filter: .constant(.all))
            .environmentObject(UserData())
    }
}


struct FilterType: CaseIterable, Hashable, Identifiable {
    var id: FilterType {
        return self
    }
    
    var name: String
    var rainProbabilityScore: RainProbabilityScore?

    init(_ rainProbabilityScore: RainProbabilityScore) {
        self.name = rainProbabilityScore.emoji
        self.rainProbabilityScore = rainProbabilityScore
    }
    
    init(name: String) {
        self.name = name
        self.rainProbabilityScore = nil
    }
    
    static var all = FilterType(name: "All")
    
    static var allCases: [FilterType] {
        return [.all] + RainProbabilityScore.allCases.map(FilterType.init)
    }
}
