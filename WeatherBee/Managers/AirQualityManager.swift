//
//  AirQualityManager.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 24/06/22.
//

import Foundation
import CoreLocation

class AirQualityManager {
    func getAirQuality(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> AirQuality {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(latitude)&lon=\(longitude)&appid=7d1fb1057f8cc6e4b201334b4819fbe0") else {
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching response from OpenWeather")
        }
        let decodedAirQualityModel = try JSONDecoder().decode(AirQuality.self, from: data)
        return decodedAirQualityModel
    }
}

