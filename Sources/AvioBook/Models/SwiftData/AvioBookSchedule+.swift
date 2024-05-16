//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 10/05/2024.
//

import Foundation

extension AvioBookScheduleRoot {
    public static var sample: AvioBookScheduleRoot = Bundle.main.decode(AvioBookScheduleRoot.self, from: "AvioBookSchedule.json", dateDecodingStrategy: .iso8601)
}

extension AvioBookScheduleItem: Hashable {
    public static func == (lhs: AvioBookScheduleItem, rhs: AvioBookScheduleItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static var example: AvioBookScheduleItem {
        return AvioBookScheduleRoot.sample.items.randomElement() ?? .empty
    }
    
    public static var empty: AvioBookScheduleItem {
        AvioBookScheduleItem(
            id: "",
            flightNumber: "",
            flightDate: "",
            atcCallSign: "",
            departure: AvioBookScheduleDeparture(airport: AvioBookScheduleAirport(icao: "", iata: "")),
            destination: AvioBookScheduleDeparture(airport: AvioBookScheduleAirport(icao: "", iata: "")),
            desk: "",
            tripTime: "",
            heavy: false,
            locked: false,
            archived: false,
            crew: [],
            ofps: [],
            warningStatus: "",
            submissionStatus: [],
            fuelAndWeightsSubmissions: [],
            status: AvioBookScheduleStatus(hasSubmittedData: false, hasLoad: false),
            fuel: AvioBookScheduleFuel(blockOff: AvioBookScheduleBlockOff(value: 0, unit: "")),
            notamSet: "",
            previousLeg: "",
            nextLeg: "",
            aircraft: AvioBookScheduleAircraft(registration: "", type: ""),
            schedule: AvioBookScheduleSchedule(std: .distantPast, etd: .distantPast, etot: .distantPast, eldt: .distantPast, sta: .distantPast, eta: .distantPast, ctot: nil),
            firstFlight: false,
            flightPhase: "",
            submittedAt: "",
            submittedBy: "",
            modifiedAt: "",
            modifiedBy: ""
        )
    }
    
    
}
