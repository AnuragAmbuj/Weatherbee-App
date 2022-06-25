//
//  AirQualityView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 24/06/22.
//

import SwiftUI

struct AirQualityView: View {
    
    var airQuality: AirQuality
    
    var dataUtil = DataUtils()
    
    var body: some View {
        VStack (alignment: .center) {
            Text("Air quality: \(dataUtil.getAqiVerdict(main: airQuality.list[0].main))")
                .bold()
            Text("NO and NH3 are x100")
                .font(.caption)
                .fontWeight(.medium)
            HStack {
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "CO", value:  String(Int(ceil(airQuality.list[0].components["co"] ?? 0))))
                Spacer()
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "NO", value: String(Int(100 * (airQuality.list[0].components["no"] ?? 0))))
            }
            
            HStack {
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "SO2", value:String(Int(ceil(airQuality.list[0].components["so2"] ?? 0))))
                Spacer()
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "PM25", value:String(Int(ceil(airQuality.list[0].components["pm2_5"] ?? 0))))
            }
            
            HStack {
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "NO2", value:String(Int(ceil(airQuality.list[0].components["no2"] ?? 0))))
                Spacer()
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "PM10", value:String(Int(ceil(airQuality.list[0].components["pm10"] ?? 0))))
            }
            
            HStack {
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "NH3", value:String(Int(100 * (airQuality.list[0].components["nh3"] ?? 0))))
                Spacer()
                WeatherRow(logo: dataUtil.getAqiLogo(main: airQuality.list[0].main), name: "O3", value:String(Int(ceil(airQuality.list[0].components["o3"] ?? 0))))
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .background(.white)
        .cornerRadius(20, corners: [.topLeft,.topRight,.bottomLeft,.bottomRight])
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView(airQuality: previewAirQuality)
    }
}
