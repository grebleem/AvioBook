//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 10/05/2024.
//

import Foundation

extension AvioBook {
    
    public func getWeather(airports: [String]) async throws -> AvioBookWeatherRoot {
        guard let request = AvioBookEndpoint.getWeather(airports: airports).request else { throw AvioBookError.requestError }
        guard let data = try await loadAvioBookData(request, attempts: 3) else { throw AvioBookError.requestError }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(AvioBookWeatherRoot.self, from: data)
    }
    
    public func getDefaultFlights() async throws -> AvioBookScheduleRoot {
        guard let request = try AvioBookEndpoint.getDefaultFlight().request else { throw AvioBookError.requestError }
        guard let data = try await loadAvioBookData(request, attempts: 3) else { throw AvioBookError.requestError }
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(AvioBookScheduleRoot.self, from: data)
    }
    
    public func flightSearch(query: String) async throws -> AvioBookScheduleRoot {
        guard let request = AvioBookEndpoint.doFlightSearch(query: query).request else { throw AvioBookError.requestError }
        guard let data = try await loadAvioBookData(request, attempts: 3) else { throw AvioBookError.requestError }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(AvioBookScheduleRoot.self, from: data)
    }
    
    
    public func getFlightPlan(id: String) async throws -> AvioBookFlightItem? {
        guard let request = AvioBookEndpoint.getFlightPlan(flightLeg: id).request else { throw AvioBookError.requestError }
        guard let data = try await loadAvioBookData(request, attempts: 3) else { throw AvioBookError.requestError }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(AvioBookFlightPlanRoot.self, from: data).items?.first
    }
}
