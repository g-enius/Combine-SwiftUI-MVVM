//
//  WeeklyWeatherViewModel.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import SwiftUI
import Combine

class WeeklyWeatherViewModel: ObservableObject {
    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []
    
    private let weatherFetcher: WeatherFetchable
    private var disposables = Set<AnyCancellable>()
    
    init(weatherFetcher: WeatherFetcher,
         scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
        self.weatherFetcher = weatherFetcher
        $city
            .print("$city")
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink(receiveValue: fetchWeather(forCity:))
            .store(in: &disposables)
    }
    
    func fetchWeather(forCity city: String) {
        weatherFetcher.weeklyWeatherForecast(forCity: city)
            .print("weeklyWeatherForecast")
            .map { response in
//                response.list.map{ DailyWeatherRowViewModel(item: $0) }
                response.list.map(DailyWeatherRowViewModel.init)
            }
            .map(Array.removeDuplicates)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure:
                    self.dataSource = []
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] forecast in
                guard let self = self else { return }
                self.dataSource = forecast
            })
            .store(in: &disposables)
    }
}

extension WeeklyWeatherViewModel {
    var currentWeatherView: some View {
        return WeeklyWeatherBuilder.makeCurrentWeatherView(withCity: city, weatherFetcher: weatherFetcher)
    }
}
