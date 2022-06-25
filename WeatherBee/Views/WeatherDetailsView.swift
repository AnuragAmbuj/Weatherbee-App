//
//  WeatherViewDetails.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 25/06/22.
//

import SwiftUI

struct WeatherDetailsView: View {
    
    var weather: WeatherResponse
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Text("Weather now")
                .bold()
            HStack {
                WeatherRow(logo: "thermometer.sun", name: "Min Temp", value: weather.main.tempMin.roundDouble() + "°")
                Spacer()
                WeatherRow(logo: "thermometer.sun.fill", name: "Max Temp", value: weather.main.tempMax.roundDouble() + "°")
            }
            
            HStack {
                WeatherRow(logo: "wind", name: "Wind Speed", value: weather.wind.speed.roundDouble() + " m/s")
                Spacer()
                WeatherRow(logo: "humidity.fill", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .padding(.bottom,8)
        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .background(.white)
        .cornerRadius(20, corners: [.topLeft,.topRight,.bottomLeft,.bottomRight])
    }
}

struct WeatherViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailsView(weather: previewWeather)
    }
}
