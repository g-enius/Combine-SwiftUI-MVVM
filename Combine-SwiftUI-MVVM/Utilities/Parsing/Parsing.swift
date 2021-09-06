//
//  Parsing.swift
//  test2
//
//  Created by Charles Wang on 5/09/21.
//

import Foundation
import Combine

func decode<T: Decodable>(data: Data) -> AnyPublisher<T, WeatherError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError{ WeatherError.parsing(description: $0.localizedDescription) }
        .eraseToAnyPublisher()
}
