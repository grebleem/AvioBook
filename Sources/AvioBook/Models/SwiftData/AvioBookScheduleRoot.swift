// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avioBookScheduleRoot = try? JSONDecoder().decode(AvioBookScheduleRoot.self, from: jsonData)

import Foundation

// MARK: - AvioBookScheduleRoot
public struct AvioBookScheduleRoot: Codable {
    public let limit: Int
    public let offset: Int
    public let total: Int
    public let items: [AvioBookScheduleItem]

    public enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }

    public init(limit: Int, offset: Int, total: Int, items: [AvioBookScheduleItem]) {
        self.limit = limit
        self.offset = offset
        self.total = total
        self.items = items
    }
}

// MARK: - AvioBookScheduleItem
public struct AvioBookScheduleItem: Codable {
    public let id: String
    public let flightNumber: String
    public let flightDate: String
    public let atcCallSign: String?
    public let departure: AvioBookScheduleDeparture?
    public let destination: AvioBookScheduleDeparture?
    public let desk: String?
    public let tripTime: String?
    public let heavy: Bool?
    public let locked: Bool?
    public let archived: Bool?
    public let crew: [AvioBookScheduleCrew]?
    public let ofps: [AvioBookScheduleOfp]?
    public let warningStatus: String?
    public let submissionStatus: [AvioBookScheduleSubmissionStatus]?
    public let fuelAndWeightsSubmissions: [AvioBookScheduleFuelAndWeightsSubmission]?
    public let status: AvioBookScheduleStatus?
    public let fuel: AvioBookScheduleFuel?
    public let notamSet: String?
    public let previousLeg: String?
    public let nextLeg: String?
    public let aircraft: AvioBookScheduleAircraft?
    public let schedule: AvioBookScheduleSchedule?
    public let firstFlight: Bool?
    public let flightPhase: String?
    public let submittedAt: String?
    public let submittedBy: String?
    public let modifiedAt: String?
    public let modifiedBy: String?

    public enum CodingKeys: String, CodingKey {
        case id
        case flightNumber
        case flightDate
        case atcCallSign
        case departure
        case destination
        case desk
        case tripTime
        case heavy
        case locked
        case archived
        case crew
        case ofps
        case warningStatus
        case submissionStatus
        case fuelAndWeightsSubmissions
        case status
        case fuel
        case notamSet
        case previousLeg
        case nextLeg
        case aircraft
        case schedule
        case firstFlight
        case flightPhase
        case submittedAt
        case submittedBy
        case modifiedAt
        case modifiedBy
    }

    public init(id: String, flightNumber: String, flightDate: String, atcCallSign: String, departure: AvioBookScheduleDeparture, destination: AvioBookScheduleDeparture, desk: String, tripTime: String, heavy: Bool, locked: Bool, archived: Bool, crew: [AvioBookScheduleCrew], ofps: [AvioBookScheduleOfp], warningStatus: String, submissionStatus: [AvioBookScheduleSubmissionStatus], fuelAndWeightsSubmissions: [AvioBookScheduleFuelAndWeightsSubmission], status: AvioBookScheduleStatus, fuel: AvioBookScheduleFuel, notamSet: String, previousLeg: String, nextLeg: String, aircraft: AvioBookScheduleAircraft, schedule: AvioBookScheduleSchedule, firstFlight: Bool, flightPhase: String, submittedAt: String, submittedBy: String, modifiedAt: String, modifiedBy: String) {
        self.id = id
        self.flightNumber = flightNumber
        self.flightDate = flightDate
        self.atcCallSign = atcCallSign
        self.departure = departure
        self.destination = destination
        self.desk = desk
        self.tripTime = tripTime
        self.heavy = heavy
        self.locked = locked
        self.archived = archived
        self.crew = crew
        self.ofps = ofps
        self.warningStatus = warningStatus
        self.submissionStatus = submissionStatus
        self.fuelAndWeightsSubmissions = fuelAndWeightsSubmissions
        self.status = status
        self.fuel = fuel
        self.notamSet = notamSet
        self.previousLeg = previousLeg
        self.nextLeg = nextLeg
        self.aircraft = aircraft
        self.schedule = schedule
        self.firstFlight = firstFlight
        self.flightPhase = flightPhase
        self.submittedAt = submittedAt
        self.submittedBy = submittedBy
        self.modifiedAt = modifiedAt
        self.modifiedBy = modifiedBy
    }
}

// MARK: - AvioBookScheduleAircraft
public struct AvioBookScheduleAircraft: Codable {
    public let registration: String
    public let type: String

    public enum CodingKeys: String, CodingKey {
        case registration
        case type
    }

    public init(registration: String, type: String) {
        self.registration = registration
        self.type = type
    }
}

// MARK: - AvioBookScheduleCrew
public struct AvioBookScheduleCrew: Codable {
    public let id: String
    public let type: AvioBookScheduleType
    public let firstName: String
    public let lastName: String
    public let ofpViewedStatus: String

    public enum CodingKeys: String, CodingKey {
        case id
        case type
        case firstName
        case lastName
        case ofpViewedStatus
    }

    public init(id: String, type: AvioBookScheduleType, firstName: String, lastName: String, ofpViewedStatus: String) {
        self.id = id
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.ofpViewedStatus = ofpViewedStatus
    }
}

// MARK: - AvioBookScheduleType
public struct AvioBookScheduleType: Codable {
    public let name: String
    public let role: String

    public enum CodingKeys: String, CodingKey {
        case name
        case role
    }

    public init(name: String, role: String) {
        self.name = name
        self.role = role
    }
}

// MARK: - AvioBookScheduleDeparture
public struct AvioBookScheduleDeparture: Codable {
    public let airport: AvioBookScheduleAirport

    public enum CodingKeys: String, CodingKey {
        case airport
    }

    public init(airport: AvioBookScheduleAirport) {
        self.airport = airport
    }
}

// MARK: - AvioBookScheduleAirport
public struct AvioBookScheduleAirport: Codable {
    public let icao: String
    public let iata: String

    public enum CodingKeys: String, CodingKey {
        case icao
        case iata
    }

    public init(icao: String, iata: String) {
        self.icao = icao
        self.iata = iata
    }
}

// MARK: - AvioBookScheduleFuel
public struct AvioBookScheduleFuel: Codable {
    public let blockOff: AvioBookScheduleBlockOff

    public enum CodingKeys: String, CodingKey {
        case blockOff
    }

    public init(blockOff: AvioBookScheduleBlockOff) {
        self.blockOff = blockOff
    }
}

// MARK: - AvioBookScheduleBlockOff
public struct AvioBookScheduleBlockOff: Codable {
    public let value: Int
    public let unit: String

    public enum CodingKeys: String, CodingKey {
        case value
        case unit
    }

    public init(value: Int, unit: String) {
        self.value = value
        self.unit = unit
    }
}

// MARK: - AvioBookScheduleFuelAndWeightsSubmission
public struct AvioBookScheduleFuelAndWeightsSubmission: Codable {
    public let id: String
    public let createdAt: Date
    public let createdBy: String
    public let status: String

    public enum CodingKeys: String, CodingKey {
        case id
        case createdAt
        case createdBy
        case status
    }

    public init(id: String, createdAt: Date, createdBy: String, status: String) {
        self.id = id
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.status = status
    }
}

// MARK: - AvioBookScheduleOfp
public struct AvioBookScheduleOfp: Codable {
    public let id: String
    public let release: String
    public let status: String
    public let createdAt: Date

    public enum CodingKeys: String, CodingKey {
        case id
        case release
        case status
        case createdAt
    }

    public init(id: String, release: String, status: String, createdAt: Date) {
        self.id = id
        self.release = release
        self.status = status
        self.createdAt = createdAt
    }
}

// MARK: - AvioBookScheduleSchedule
public struct AvioBookScheduleSchedule: Codable {
    public let std: Date?
    public let etd: Date?
    public let etot: Date?
    public let eldt: Date?
    public let sta: Date?
    public let eta: Date?
    public let ctot: Date?

    public enum CodingKeys: String, CodingKey {
        case std
        case etd
        case etot
        case eldt
        case sta
        case eta
        case ctot
    }

    public init(std: Date, etd: Date, etot: Date, eldt: Date, sta: Date, eta: Date, ctot: Date?) {
        self.std = std
        self.etd = etd
        self.etot = etot
        self.eldt = eldt
        self.sta = sta
        self.eta = eta
        self.ctot = ctot
    }
}

// MARK: - AvioBookScheduleStatus
public struct AvioBookScheduleStatus: Codable {
    public let hasSubmittedData: Bool
    public let hasLoad: Bool

    public enum CodingKeys: String, CodingKey {
        case hasSubmittedData
        case hasLoad
    }

    public init(hasSubmittedData: Bool, hasLoad: Bool) {
        self.hasSubmittedData = hasSubmittedData
        self.hasLoad = hasLoad
    }
}

// MARK: - AvioBookScheduleSubmissionStatus
public struct AvioBookScheduleSubmissionStatus: Codable {
    public let type: String
    public let status: String

    public enum CodingKeys: String, CodingKey {
        case type
        case status
    }

    public init(type: String, status: String) {
        self.type = type
        self.status = status
    }
}
