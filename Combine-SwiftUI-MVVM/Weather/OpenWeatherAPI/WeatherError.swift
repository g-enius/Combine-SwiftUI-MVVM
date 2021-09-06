//
//  WeatherError.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import Foundation

enum WeatherError: Error {
    case parsing(description: String)
    case network(description: String)
}
