//
//  CurrentWeatherRow.swift
//  test2
//
//  Created by Charles Wang on 6/09/21.
//

import SwiftUI

struct CurrentWeatherRow: View {
    private let viewModel: CurrentWeatherRowViewModel
    
    init(viewModel: CurrentWeatherRowViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: .leading) {
            MapView(coordinate: viewModel.coordinate)
                .cornerRadius(25)
                .frame(height: 300)
                .disabled(true)
            
            VStack(alignment: .leading) {
                HStack {
                  Text("☀️ Temperature:")
                  Text("\(viewModel.temperature)°")
                    .foregroundColor(.gray)
                }
                
                HStack {
                  Text("📈 Max temperature:")
                  Text("\(viewModel.maxTemperature)°")
                    .foregroundColor(.gray)
                }
                
                HStack {
                  Text("📉 Min temperature:")
                  Text("\(viewModel.minTemperature)°")
                    .foregroundColor(.gray)
                }
                
                HStack {
                  Text("💧 Humidity:")
                  Text(viewModel.humidity)
                    .foregroundColor(.gray)
                }
            }
        }
    }
}

//struct CurrentWeatherRow_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherRow()
//    }
//}
