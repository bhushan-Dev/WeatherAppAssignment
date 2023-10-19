//
//  WeatherData.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import Foundation

struct WeatherData: Codable {
    var weather: [Weather]
    var main: TemperatureData
    var name: String
}


struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
}


struct TemperatureData: Codable {
    var temp: Double
    var humidity: Double
    var temp_min: Double
    var temp_max: Double
}
