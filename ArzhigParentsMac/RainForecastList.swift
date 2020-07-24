//
//  RainForecastList.swift
//  ArzhigParentsMac
//
//  Created by Mickaël Floc'hlay on 19/04/2020.
//  Copyright © 2020 mickf.net. All rights reserved.
//

import SwiftUI

struct RainForecastList: View {
    @EnvironmentObject private var userData: UserData
    @Binding var selectedRainForecast: RainForecast?
    @Binding var filter: FilterType
    
    var body: some View {
        List(selection: $selectedRainForecast) {
            ForEach(userData.sampleData) { rainForecast in
                if (self.filter == .all || self.filter.rainProbabilityScore == rainForecast.rainProbabilityScore) {
                RainForecastRow(rainForecast: rainForecast).tag(rainForecast)
                }
            }
        }
    }
}

struct RainForecastList_Previews: PreviewProvider {
    static var previews: some View {
        RainForecastList(selectedRainForecast: .constant(nil),
                         filter: .constant(.all))
        .environmentObject(UserData())
    }
}
