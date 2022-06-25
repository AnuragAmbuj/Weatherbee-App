//
//  WeatherSubView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 25/06/22.
//

import SwiftUI

struct WeatherSubView: View {
    
    var weather: WeatherResponse
    
    let dataUtils = DataUtils()
    
    var body: some View {
        VStack(alignment: .center) {
            WeatherHeadView(weather: weather, dataUtils: dataUtils)
            Spacer().frame(height: 10)
            WeatherDetailsView(weather: weather)
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct WeatherSubView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSubView(weather: previewWeather)
    }
}
