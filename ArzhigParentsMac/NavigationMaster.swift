import SwiftUI

struct NavigationMaster: View {
    @Binding var selectedRainForecast: RainForecast?
    @State private var filter: FilterType = .all

    var body: some View {
        VStack {
            Filter(filter: $filter)
                .controlSize(.small)
                .padding([.top, .leading], 8)
                .padding(.trailing, 4)
            
            RainForecastList(selectedRainForecast: $selectedRainForecast,
                             filter: $filter)
            .listStyle(SidebarListStyle())
        }
    .frame(minWidth: 225, maxWidth: 300)
    }
}

struct NavigationMaster_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMaster(selectedRainForecast: .constant(nil))
        .environmentObject(UserData())
    }
}
