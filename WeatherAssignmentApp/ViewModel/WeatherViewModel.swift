//
//  WeatherViewModel.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    var geoCodingData: [DirectGeocodingData]?
    
    func getWeatherData(lat: String, long: String) {
        APIManager.shared.getWeatherDataWith(latitude: lat, longitude: long) { response in
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.weatherData = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getCityWeatherData(city: String) {
        APIManager.shared.getDirectGeoCodingDataWith(city: city) { response in
            switch response {
            case .success(let data):
                DispatchQueue.main.async {
                    self.geoCodingData = data
                    if let geoCode = self.geoCodingData?.first {
                        self.getWeatherData(lat: "\(geoCode.lat)", long: "\(geoCode.lon)")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
