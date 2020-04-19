import SwiftUI

struct RainForecastList: View {
    var body: some View {
        NavigationView {
            List(RainForecast.sampleData) { rainForecast in
                NavigationLink(destination: RainForecastDetail()) {
                    RainForecastRow(rainForecast: rainForecast)
                }
            }
        .navigationBarTitle(Text("Rain Forecast"))
        }
    }
}

struct RainForecastList_Previews: PreviewProvider {
    static var previews: some View {
        RainForecastList()
    }
}
