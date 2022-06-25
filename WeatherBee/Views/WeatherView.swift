//
//  WeatherView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 28/03/22.
//

import SwiftUI
import CoreLocation

struct WeatherView: View {
    
    var latitude: CLLocationDegrees
    
    var longitude: CLLocationDegrees
    
    let weatherManager = WeatherManager()
    
    let airQualityManager = AirQualityManager()
    
    @State var weather: WeatherResponse?
    
    @State var airQuality: AirQuality?
    
    let dataUtils = DataUtils()
    
    var body: some View {
        ZStack (alignment: .leading) {
            VStack {
                if let weather = weather {
                    CityAndDateView(weather: weather)
                    Spacer().frame(height: 30)
                    WeatherSubView(weather: weather)
                        .padding()
                }else{
                    ProgressView()
                        .task {
                            do { weather = try await weatherManager
                                .getCurrentWeather(latitude: latitude, longitude: longitude)
                            }catch {
                                print("Error getting weather \(error)")
                            }
                        }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                if let airQuality = airQuality {
                    AirQualityView(airQuality: airQuality)
                }else{
                    ProgressView()
                        .task {
                            do {
                                airQuality = try await airQualityManager.getAirQuality(latitude: latitude, longitude: longitude)
                            }catch{
                                print("Error getting weather quality \(error)")
                            }
                        }
                }
            }
            .padding(.top,30)
            .padding(.bottom,30)
            .padding(.leading,20)
            .padding(.trailing,20)
            .shadow(radius: 10)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(latitude: 24.4, longitude: 86.6)
    }
}


extension String {
    var capitalised: String {
        let oldString = self as NSString
        return oldString.capitalized
    }
}
