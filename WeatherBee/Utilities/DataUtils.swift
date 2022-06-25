//
//  DataUtils.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 18/06/22.
//

import Foundation
import SwiftUI


struct DataUtils {
    func findImageURLForWeather(weather: Weather) -> String {
        return "https://openweathermap.org/img/wn/\(weather.icon)@2x.png"
    }
    
    func getAqiLogo(main: AqiMain) -> String {
        switch(main.aqi) {
        case 1,2: return "aqi.low"
        case 3: return "aqi.medium"
        case 4,5: return "aqi.high"
        default:
            return "aqi.high"
        }
    }
    
    func getAqiVerdict(main: AqiMain)-> String {
        switch(main.aqi) {
        case 1: return "Good"
        case 2: return "Fair"
        case 3: return "Moderate"
        case 4: return "Poor"
        case 5: return "Very Poor"
        default:
            return "Poor"
        }
    }
}
