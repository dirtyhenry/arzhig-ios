import SwiftUI

struct RainForecastRow: View {
    var rainForecast: RainForecast

    var body: some View {
        HStack {
            Text(rainForecast.emoji)
                .font(.largeTitle)
                .frame(width: 50.0, height: 50.0, alignment: .center)
            Text(rainForecast.localizedTime)
                .font(.body)
            Text(rainForecast.localizedDescription)
            .font(.body)
            Spacer()
        }
    }
}

struct RainForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RainForecastRow(rainForecast: RainForecast.sampleData[0])
            RainForecastRow(rainForecast: RainForecast.sampleData[1])
        }.previewLayout(.fixed(width: 300, height: 70))
    }
}
