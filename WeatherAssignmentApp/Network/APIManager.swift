//
//  APIManager.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import Foundation

final class APIManager {
    static var shared = APIManager()
    
    private init() {}
    
    func getWeatherDataWith(latitude: String, longitude: String, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let queryItems = [
            URLQueryItem(name: "lat", value: latitude),
            URLQueryItem(name: "lon", value: longitude),
            URLQueryItem(name: "appid", value: Constants.API.key.rawValue)
        ]
        guard var urlComps = URLComponents(string: Constants.API.baseURL.rawValue + Constants.API.weather.rawValue) else {
            return
        }
        urlComps.queryItems = queryItems
        guard let url =  urlComps.url else {
            return
        }

        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    completion(.success(weatherData))
                } catch let e {
                    print("Unable to parse")
                    completion(.failure(e))
                }
            }
        }
        task.resume()
    }
    
    func getDirectGeoCodingDataWith(city: String, completion: @escaping (Result<[DirectGeocodingData], Error>) -> Void) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: Constants.API.key.rawValue)
        ]
        guard var urlComps = URLComponents(string: Constants.API.baseURL.rawValue + Constants.API.geoCoding.rawValue) else {
            return
        }
        urlComps.queryItems = queryItems
        guard let url =  urlComps.url else {
            return
        }

        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                do {
                    let geocodingData = try JSONDecoder().decode([DirectGeocodingData].self, from: data)
                    completion(.success(geocodingData))
                } catch let e {
                    print("Unable to parse")
                    completion(.failure(e))
                }
            }
        }
        task.resume()
    }
}
