//
//  ContentView.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()
    var state = false

    var body: some View {
        TabView {
            CurrentWeatherView(viewModel: viewModel)
                .tabItem {
                    Label("Location Weather", systemImage: "list.dash")
                }
            
            CityWeatherView(viewModel: viewModel)
                .tabItem {
                    Label("City Weather", systemImage: "square.and.pencil")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
