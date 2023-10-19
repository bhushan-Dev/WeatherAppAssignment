//
//  CityWeatherView.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import SwiftUI

struct CityWeatherView: View {
    @State private var cityField = ""
    @ObservedObject var viewModel: WeatherViewModel
    @State private var showWeatherView: Bool = false

    var body: some View {
        VStack {
            HeaderView(headigLabel: "City Weather")

            VStack {
                TextField("Enter  City", text: $cityField)
                    .textFieldStyle(.roundedBorder)
                Button("Get Weather") {
                    if !cityField.isEmpty {
                        viewModel.getCityWeatherData(city: cityField)
                        showWeatherView = true
                    }
                }
                .padding(8)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
            
            if showWeatherView {
                VStack {
                    WeatherReportView(viewModel: viewModel)
                }
            }
            
            Spacer()
            
        }
        .onAppear(perform: {
            showWeatherView = false
        })
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView(viewModel: WeatherViewModel())
    }
}
