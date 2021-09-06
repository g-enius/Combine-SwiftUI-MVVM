//
//  WeeklyWeatherView.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import SwiftUI

struct WeeklyWeatherView: View {
    @ObservedObject var viewModel: WeeklyWeatherViewModel
    
    init(viewModel: WeeklyWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                searchField
                
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    cityHourlyWeatherSection
                    forecastSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Weather ⛅️")
        }
    }
}

private extension WeeklyWeatherView {
    var searchField: some View {
        HStack(alignment: .center) {
            TextField("e.g. Auckland", text: $viewModel.city)
        }
    }
    
    var forecastSection: some View {
        Section {
            ForEach(viewModel.dataSource, content: DailyWeatherRow.init(viewModel:))
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
                .foregroundColor(.gray)
        }
    }
    
    var cityHourlyWeatherSection: some View {
        Section {
            NavigationLink(destination: viewModel.currentWeatherView) {
                VStack(alignment: .leading) {
                    Text(viewModel.city)
                    Text("Weather today")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

//struct WeeklyWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        let fetcher = WeatherFetcher()
//        let viewModel = WeeklyWeatherViewModel(weatherFetcher: fetcher)
//        WeeklyWeatherView(viewModel: viewModel)
//    }
//}
