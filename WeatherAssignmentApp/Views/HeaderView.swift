//
//  HeaderView.swift
//  WeatherAssignmentApp
//
//  Created by Bhushan Gopinath Udawant on 19/10/23.
//

import SwiftUI

struct HeaderView: View {
    var headigLabel: String

    var body: some View {
        HStack {
            Spacer()
            Text(headigLabel)
            Spacer()
        }
        .padding()
        .background(.cyan)
        .bold()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headigLabel: "Test")
    }
}
