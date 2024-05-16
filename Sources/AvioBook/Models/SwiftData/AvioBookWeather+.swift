//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 10/05/2024.
//

import Foundation

extension AvioBookWeatherRoot {
    public static var sample: AvioBookWeatherRoot = Bundle.main.decode(AvioBookWeatherRoot.self, from: "AvioBookWeather.json", dateDecodingStrategy: .iso8601)
}
extension AvioBookWeatherItem: Identifiable {
    public var id: String {
        UUID().uuidString
    }
    
    public static var sampleItem: AvioBookWeatherItem {
        return AvioBookWeatherRoot.sample.items.randomElement() ?? .emptyItem
    }
    
    public static var emptyItem: AvioBookWeatherItem {
        AvioBookWeatherItem(
            icao: "",
            iata: "",
            weather: AvioBookWeatherWeather(
                metar: "",
                parsedMetar: AvioBookWeatherWeatherParsedMetar(
                    issuedAt: .distantPast,
                    warningLevel: .unreadable,
                    annotated: "",
                    wind: AvioBookWeatherWind(
                        direction: nil,
                        speed: 0,
                        unit: .kt,
                        gust: nil,
                        variableDirection1: nil,
                        variableDirection2: nil
                    ),
                    airTemperature: AvioBookWeatherAirTemperature(
                        value: 0,
                        unit: .c
                    ),
                    skyConditions: [],
                    prevailingVisibility: AvioBookWeatherPrevailingVisibility(
                        boundary: .atLeast,
                        value: 0,
                        unit: .m
                    ),
                    qnh: AvioBookWeatherQnh(
                        value: 0,
                        unit: .hpa
                    ),
                    flightRule: .vfr,
                    phenomena: nil
                ),
                isMetarApplicable: false,
                historicalMetars: [],
                applicableTaf: .ftTaf,
                ftTaf: "",
                parsedFtTaf: .init(
                    issuedAt: .distantPast,
                    warningLevel: .unreadable,
                    annotated: "",
                    validFrom: .distantPast,
                    validTo: .distantPast
                )
            )
        )
    }
}
