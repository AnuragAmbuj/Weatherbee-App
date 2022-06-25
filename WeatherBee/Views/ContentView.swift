//
//  ContentView.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 27/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    
    var airQualityManager = AirQualityManager()
    
    @State var weather: WeatherResponse?
    
    @State var air: AirQuality?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                WeatherView(latitude: location.latitude, longitude: location.longitude)
            }else{
                if(locationManager.loading){
                    LoadingView()
                }else{
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
