//
//  CurrentWeatherView.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import SwiftUI

struct CurrentWeatherView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {
        VStack {
            HeaderView(headigLabel: "Current Weather")
            VStack {
                switch locationDataManager.locationManager.authorizationStatus {
                case .authorizedWhenInUse:
                    WeatherReportView(viewModel: viewModel)
                        .task {
                            if let location = locationDataManager.location {
                                viewModel.getWeatherData(lat: location.latitude.description , long: location.longitude.description)
                            }
                        }
                    
                case .restricted, .denied:
                    Text("Current location data was restricted or denied.")
                case .notDetermined:
                    Text("Finding your location...")
                    ProgressView()
                default:
                    ProgressView()
                }
            }
            
            Spacer()
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(viewModel: WeatherViewModel())
    }
}
