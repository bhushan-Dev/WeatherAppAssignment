//
//  WeatherReportView.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import SwiftUI

struct WeatherReportView: View {
    @ObservedObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
            let climate = viewModel.weatherData?.weather.first?.main
            let description = viewModel.weatherData?.weather.first?.description
            let humidity = viewModel.weatherData?.main.humidity
            let name = viewModel.weatherData?.name
            
            HStack {
                VStack(alignment: .leading) {
                    Text("\(name ?? "")")
                    Text("Climate: \(climate ?? "")")
                    Text("\(description ?? "")")
                    HStack {
                        Text("Humidity: \(humidity ?? 0)")
                    }.padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
            }.padding()
        }
    }
}

struct WeatherReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherReportView(viewModel: WeatherViewModel())
    }
}
