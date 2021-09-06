//
//  DailyWeatherRowViewModel.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import Foundation
import Combine

struct DailyWeatherRowViewModel: Identifiable {
    private let item: WeeklyForcastResponse.Item
    
    var day: String {
        return dayFormatter.string(from: item.date)
    }
    
    var month: String {
        return monthFormatter.string(from: item.date)
    }
    
    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }
    
    var title: String {
        guard let title = item.weather.first?.main.rawValue else { return "" }
        return title
    }
    
    var fullDescription: String {
        guard let description = item.weather.first?.weatherDescription else { return "" }
        
        return description
    }
    
    var id: String {
        return day + temperature + title
    }
    
    init(item: WeeklyForcastResponse.Item) {
        self.item = item
    }
}

//Referencing static method 'removeDuplicates' on 'Array' requires that 'DailyWeatherRowViewModel' conform to 'Hashable'
extension DailyWeatherRowViewModel: Hashable{
    static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
        return lhs.day == rhs.day
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.day)
    }
}
