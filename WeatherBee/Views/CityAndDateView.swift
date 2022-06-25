//
//  TemparatureHeadlineView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 25/06/22.
//

import SwiftUI

struct CityAndDateView: View {
    
    var weather: WeatherResponse
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(weather.name).font(.system(size: 20)).bold()
                Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .font(.system(size: 15)).fontWeight(.medium)
            }
            Button {
                // TODO
            } label: {
                Image(systemName: "arrow.clockwise.circle.fill")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
            Spacer()
            
        }
    }
}

struct TemparatureHeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        CityAndDateView(weather: previewWeather)
    }
}
