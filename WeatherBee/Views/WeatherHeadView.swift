//
//  WeatherHeadView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 25/06/22.
//

import SwiftUI

struct WeatherHeadView: View {
    
    var weather: WeatherResponse
    
    var dataUtils = DataUtils()
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                ZStack {
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(uiColor: .systemBlue))
                        .cornerRadius(10, corners: .allCorners)
                    AsyncImage(url: URL(string: dataUtils.findImageURLForWeather(weather: weather.weather[0]))) { image in image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                    } placeholder: {
                        ProgressView()
                    }
                    .shadow(color: Color(uiColor: .gray), radius: 5, x: 0, y: 5)
                }
            }
            Spacer()
            VStack(alignment:.center) {
                Text(weather.main.feelsLike.roundDouble() + "° C")
                    .font(.system(size: 30)).fontWeight(.semibold)
                Text(weather.weather[0].weatherDescription.capitalized).font(.system(size: 15))
                    .fontWeight(.semibold)
            }
        }
        .padding()
    }
}

struct WeatherHeadView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherHeadView(weather: previewWeather)
    }
}
