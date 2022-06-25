//
//  AirQualityModel.swift
//  WeatherBee
//
//  Created by Anurag Ambuj on 24/06/22.
//

import Foundation


import Foundation

struct AirQuality: Codable {
    let coord: Coord
    let list: [Metrics]
}

struct Metrics: Codable{
    let main: AqiMain
    let components: [String: Double]
    let dt: Int
}

struct AqiMain: Codable {
    let aqi: Int
}
