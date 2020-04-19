import SwiftUI

struct RainForecastRow: View {
    var rainForecast: RainForecast

    var body: some View {
        HStack(alignment: .center) {
            Text(rainForecast.emoji)
            .aspectRatio(1.0, contentMode: .fit)
            .frame(width: 32, height: 32)
            .fixedSize(horizontal: true, vertical: false)
            .cornerRadius(4.0)
            

            VStack(alignment: .leading) {
                Text(rainForecast.localizedTime)
                    .fontWeight(.bold)
                    .truncationMode(.tail)
                    .frame(minWidth: 20)

                Text(rainForecast.localizedDescription)
                    .font(.caption)
                    .opacity(0.625)
                    .truncationMode(.middle)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct RainForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        RainForecastRow(rainForecast: RainForecast.sampleData[0])
    }
}
