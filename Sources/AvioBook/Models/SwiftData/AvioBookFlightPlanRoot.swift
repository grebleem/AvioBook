// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avioBookFlightPlanRoot = try? JSONDecoder().decode(AvioBookFlightPlanRoot.self, from: jsonData)

import Foundation

// MARK: - AvioBookFlightPlanRoot
public struct AvioBookFlightPlanRoot: Codable {
    public let limit: Int
    public let offset: Int
    public let total: Int
    public let items: [AvioBookFlightItem]?

    public enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }

    public init(limit: Int, offset: Int, total: Int, items: [AvioBookFlightItem]) {
        self.limit = limit
        self.offset = offset
        self.total = total
        self.items = items
    }
}

// MARK: - AvioBookItem
public struct AvioBookFlightItem: Codable {
    public let metadata: AvioBookMetadata
    public let summary: AvioBookSummary
    public let fuel: AvioBookFuel
    public let weight: AvioBookWeight
    public let planningData: AvioBookPlanningData?
    public let route: [AvioBookItemRoute]
    public let altRoutes: [AvioBookAltRoute]
    public let extraInfo: [AvioBookExtraInfo]
    public let units: AvioBookUnits
    public let airports: [AvioBookAirportElement]
    public let firs: [AvioBookFir]
    public let etopsSummary: AvioBookEtopsSummary?
    public let attachment: String
    public let atcFlightPlan: String

    public enum CodingKeys: String, CodingKey {
        case metadata
        case summary
        case fuel
        case weight
        case planningData
        case route
        case altRoutes
        case extraInfo
        case units
        case airports
        case firs
        case etopsSummary
        case attachment
        case atcFlightPlan
    }

    public init(metadata: AvioBookMetadata, summary: AvioBookSummary, fuel: AvioBookFuel, weight: AvioBookWeight, planningData: AvioBookPlanningData, route: [AvioBookItemRoute], altRoutes: [AvioBookAltRoute], extraInfo: [AvioBookExtraInfo], units: AvioBookUnits, airports: [AvioBookAirportElement], firs: [AvioBookFir], etopsSummary: AvioBookEtopsSummary, attachment: String, atcFlightPlan: String) {
        self.metadata = metadata
        self.summary = summary
        self.fuel = fuel
        self.weight = weight
        self.planningData = planningData
        self.route = route
        self.altRoutes = altRoutes
        self.extraInfo = extraInfo
        self.units = units
        self.airports = airports
        self.firs = firs
        self.etopsSummary = etopsSummary
        self.attachment = attachment
        self.atcFlightPlan = atcFlightPlan
    }
}

// MARK: - AvioBookAirportElement
public struct AvioBookAirportElement: Codable {
    public let name: String?
    public let iata: String?
    public let icao: String
    public let function: String

    public enum CodingKeys: String, CodingKey {
        case name
        case iata
        case icao
        case function
    }

    public init(name: String?, iata: String?, icao: String, function: String) {
        self.name = name
        self.iata = iata
        self.icao = icao
        self.function = function
    }
}

// MARK: - AvioBookAltRoute
public struct AvioBookAltRoute: Codable {
    public let airport: AvioBookAltRouteAirport
    public let route: [AvioBookAltRouteRoute]

    public enum CodingKeys: String, CodingKey {
        case airport
        case route
    }

    public init(airport: AvioBookAltRouteAirport, route: [AvioBookAltRouteRoute]) {
        self.airport = airport
        self.route = route
    }
}

// MARK: - AvioBookAltRouteAirport
public struct AvioBookAltRouteAirport: Codable {
    public let name: String
    public let iata: String
    public let icao: String
    public let function: String

    public enum CodingKeys: String, CodingKey {
        case name
        case iata
        case icao
        case function
    }

    public init(name: String, iata: String, icao: String, function: String) {
        self.name = name
        self.iata = iata
        self.icao = icao
        self.function = function
    }
}

// MARK: - AvioBookAltRouteRoute
public struct AvioBookAltRouteRoute: Codable {
    public let type: String
    public let name: String
    public let orderNumber: Int
    public let coordinates: AvioBookCoordinates
    public let eet: String
    public let info: String
    public let plndFuelOnBoard: Int
    public let plndTimeOverflight: String
    public let airway: String
    public let fl: Int?
    public let gdis: Int?
    public let gs: Int?
    public let temp: Int?
    public let ma: Int?
    public let mt: Int?
    public let tt: Int?
    public let wv: String?

    public enum CodingKeys: String, CodingKey {
        case type
        case name
        case orderNumber
        case coordinates
        case eet
        case info
        case plndFuelOnBoard
        case plndTimeOverflight
        case airway
        case fl
        case gdis
        case gs
        case temp
        case ma
        case mt
        case tt
        case wv
    }

    public init(type: String, name: String, orderNumber: Int, coordinates: AvioBookCoordinates, eet: String, info: String, plndFuelOnBoard: Int, plndTimeOverflight: String, airway: String, fl: Int?, gdis: Int?, gs: Int?, temp: Int?, ma: Int?, mt: Int?, tt: Int?, wv: String?) {
        self.type = type
        self.name = name
        self.orderNumber = orderNumber
        self.coordinates = coordinates
        self.eet = eet
        self.info = info
        self.plndFuelOnBoard = plndFuelOnBoard
        self.plndTimeOverflight = plndTimeOverflight
        self.airway = airway
        self.fl = fl
        self.gdis = gdis
        self.gs = gs
        self.temp = temp
        self.ma = ma
        self.mt = mt
        self.tt = tt
        self.wv = wv
    }
}

// MARK: - AvioBookCoordinates
public struct AvioBookCoordinates: Codable {
    public let latitude: Double
    public let longitude: Double

    public enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - AvioBookEtopsSummary
public struct AvioBookEtopsSummary: Codable {
    public let ruleTime: String
    public let borderTime: String
    public let criticalPositions: [AvioBookCriticalPosition]

    public enum CodingKeys: String, CodingKey {
        case ruleTime
        case borderTime
        case criticalPositions
    }

    public init(ruleTime: String, borderTime: String, criticalPositions: [AvioBookCriticalPosition]) {
        self.ruleTime = ruleTime
        self.borderTime = borderTime
        self.criticalPositions = criticalPositions
    }
}

// MARK: - AvioBookCriticalPosition
public struct AvioBookCriticalPosition: Codable {
    public let type: String
    public let name: String
    public let coordinates: AvioBookCoordinates
    public let suitableAirports: [AvioBookSuitableAirport]
    public let adequateAirports: [AvioBookAdequateAirport]?

    public enum CodingKeys: String, CodingKey {
        case type
        case name
        case coordinates
        case suitableAirports
        case adequateAirports
    }

    public init(type: String, name: String, coordinates: AvioBookCoordinates, suitableAirports: [AvioBookSuitableAirport], adequateAirports: [AvioBookAdequateAirport]?) {
        self.type = type
        self.name = name
        self.coordinates = coordinates
        self.suitableAirports = suitableAirports
        self.adequateAirports = adequateAirports
    }
}

// MARK: - AvioBookAdequateAirport
public struct AvioBookAdequateAirport: Codable {
    public let icao: String
    public let function: String

    public enum CodingKeys: String, CodingKey {
        case icao
        case function
    }

    public init(icao: String, function: String) {
        self.icao = icao
        self.function = function
    }
}

// MARK: - AvioBookSuitableAirport
public struct AvioBookSuitableAirport: Codable {
    public let iata: String
    public let icao: String
    public let function: String
    public let remainingFlightTime: String
    public let remainingGroundDistance: Int

    public enum CodingKeys: String, CodingKey {
        case iata
        case icao
        case function
        case remainingFlightTime
        case remainingGroundDistance
    }

    public init(iata: String, icao: String, function: String, remainingFlightTime: String, remainingGroundDistance: Int) {
        self.iata = iata
        self.icao = icao
        self.function = function
        self.remainingFlightTime = remainingFlightTime
        self.remainingGroundDistance = remainingGroundDistance
    }
}

// MARK: - AvioBookExtraInfo
public struct AvioBookExtraInfo: Codable {
    public let sequence: Int
    public let title: String
    public let type: String
    public let value: String

    public enum CodingKeys: String, CodingKey {
        case sequence
        case title
        case type
        case value
    }

    public init(sequence: Int, title: String, type: String, value: String) {
        self.sequence = sequence
        self.title = title
        self.type = type
        self.value = value
    }
}

// MARK: - AvioBookFir
public struct AvioBookFir: Codable {
    public let icao: String

    public enum CodingKeys: String, CodingKey {
        case icao
    }

    public init(icao: String) {
        self.icao = icao
    }
}

// MARK: - AvioBookFuel
public struct AvioBookFuel: Codable {
    public let contPolicy: String
    public let alt1: AvioBookAlt1
    public let block: AvioBookAlt1
    public let cont: AvioBookAlt1
    public let extra: AvioBookAlt1
    public let fres: AvioBookAlt1
    public let ldg: AvioBookLdg
    public let minTo: AvioBookAlt1
    public let taxi: AvioBookAlt1
    public let trip: AvioBookAlt1
    public let tripCorrection: Double
    public let holdingFuelFlow: Double
    public let costIndex: Int

    public enum CodingKeys: String, CodingKey {
        case contPolicy
        case alt1
        case block
        case cont
        case extra
        case fres
        case ldg
        case minTo
        case taxi
        case trip
        case tripCorrection
        case holdingFuelFlow
        case costIndex
    }

    public init(contPolicy: String, alt1: AvioBookAlt1, block: AvioBookAlt1, cont: AvioBookAlt1, extra: AvioBookAlt1, fres: AvioBookAlt1, ldg: AvioBookLdg, minTo: AvioBookAlt1, taxi: AvioBookAlt1, trip: AvioBookAlt1, tripCorrection: Double, holdingFuelFlow: Double, costIndex: Int) {
        self.contPolicy = contPolicy
        self.alt1 = alt1
        self.block = block
        self.cont = cont
        self.extra = extra
        self.fres = fres
        self.ldg = ldg
        self.minTo = minTo
        self.taxi = taxi
        self.trip = trip
        self.tripCorrection = tripCorrection
        self.holdingFuelFlow = holdingFuelFlow
        self.costIndex = costIndex
    }
}

// MARK: - AvioBookAlt1
public struct AvioBookAlt1: Codable {
    public let fuel: Int
    public let time: String

    public enum CodingKeys: String, CodingKey {
        case fuel
        case time
    }

    public init(fuel: Int, time: String) {
        self.fuel = fuel
        self.time = time
    }
}

// MARK: - AvioBookLdg
public struct AvioBookLdg: Codable {
    public let fuel: Int

    public enum CodingKeys: String, CodingKey {
        case fuel
    }

    public init(fuel: Int) {
        self.fuel = fuel
    }
}

// MARK: - AvioBookMetadata
public struct AvioBookMetadata: Codable {
    public let id: String
    public let leg: String
    public let createdAt: Date
    public let modifiedAt: Date
    public let modifiedBy: String

    public enum CodingKeys: String, CodingKey {
        case id
        case leg
        case createdAt
        case modifiedAt
        case modifiedBy
    }

    public init(id: String, leg: String, createdAt: Date, modifiedAt: Date, modifiedBy: String) {
        self.id = id
        self.leg = leg
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.modifiedBy = modifiedBy
    }
}

// MARK: - AvioBookPlanningData
public struct AvioBookPlanningData: Codable {
    public let awc: Int?
    public let airDist: Int?
    public let altFL: Int?
    public let gndDist: Int?
    public let alternateOptions: [AvioBookAlternateOption]

    public enum CodingKeys: String, CodingKey {
        case awc
        case airDist
        case altFL
        case gndDist
        case alternateOptions
    }

    public init(awc: Int, airDist: Int, altFL: Int, gndDist: Int, alternateOptions: [AvioBookAlternateOption]) {
        self.awc = awc
        self.airDist = airDist
        self.altFL = altFL
        self.gndDist = gndDist
        self.alternateOptions = alternateOptions
    }
}

// MARK: - AvioBookAlternateOption
public struct AvioBookAlternateOption: Codable {
    public let icao: String
    public let altFuel: Int
    public let eet: String
    public let fl: Int
    public let gdis: Int
    public let info: String
    public let wv: String

    public enum CodingKeys: String, CodingKey {
        case icao
        case altFuel
        case eet
        case fl
        case gdis
        case info
        case wv
    }

    public init(icao: String, altFuel: Int, eet: String, fl: Int, gdis: Int, info: String, wv: String) {
        self.icao = icao
        self.altFuel = altFuel
        self.eet = eet
        self.fl = fl
        self.gdis = gdis
        self.info = info
        self.wv = wv
    }
}

// MARK: - AvioBookItemRoute
public struct AvioBookItemRoute: Codable {
    public let type: String
    public let name: String
    public let orderNumber: Int
    public let coordinates: AvioBookCoordinates
    public let eet: String
    public let info: String
    public let plndFuelOnBoard: Int
    public let plndTimeOverflight: String
    public let wv: String
    public let airway: String
    public let fl: Int?
    public let gdis: Int?
    public let gs: Int?
    public let temp: Int?
    public let ma: Int?
    public let mt: Int?
    public let tt: Int?
    public let function: String?

    public enum CodingKeys: String, CodingKey {
        case type
        case name
        case orderNumber
        case coordinates
        case eet
        case info
        case plndFuelOnBoard
        case plndTimeOverflight
        case wv
        case airway
        case fl
        case gdis
        case gs
        case temp
        case ma
        case mt
        case tt
        case function
    }

    public init(type: String, name: String, orderNumber: Int, coordinates: AvioBookCoordinates, eet: String, info: String, plndFuelOnBoard: Int, plndTimeOverflight: String, wv: String, airway: String, fl: Int?, gdis: Int?, gs: Int?, temp: Int?, ma: Int?, mt: Int?, tt: Int?, function: String?) {
        self.type = type
        self.name = name
        self.orderNumber = orderNumber
        self.coordinates = coordinates
        self.eet = eet
        self.info = info
        self.plndFuelOnBoard = plndFuelOnBoard
        self.plndTimeOverflight = plndTimeOverflight
        self.wv = wv
        self.airway = airway
        self.fl = fl
        self.gdis = gdis
        self.gs = gs
        self.temp = temp
        self.ma = ma
        self.mt = mt
        self.tt = tt
        self.function = function
    }
}

// MARK: - AvioBookSummary
public struct AvioBookSummary: Codable {
    public let version: String
    public let status: String
    public let flight: AvioBookFlight
    public let schedule: AvioBookSchedule
    public let dispatcher: AvioBookDispatcher
    public let remarks: String

    public enum CodingKeys: String, CodingKey {
        case version
        case status
        case flight
        case schedule
        case dispatcher
        case remarks
    }

    public init(version: String, status: String, flight: AvioBookFlight, schedule: AvioBookSchedule, dispatcher: AvioBookDispatcher, remarks: String) {
        self.version = version
        self.status = status
        self.flight = flight
        self.schedule = schedule
        self.dispatcher = dispatcher
        self.remarks = remarks
    }
}

// MARK: - AvioBookDispatcher
public struct AvioBookDispatcher: Codable {
    public let name: String
    public let phone: String

    public enum CodingKeys: String, CodingKey {
        case name
        case phone
    }

    public init(name: String, phone: String) {
        self.name = name
        self.phone = phone
    }
}

// MARK: - AvioBookFlight
public struct AvioBookFlight: Codable {
    public let registration: String
    public let number: String
    public let date: String
    public let aircraftType: String
    public let atcCallSign: String

    public enum CodingKeys: String, CodingKey {
        case registration
        case number
        case date
        case aircraftType
        case atcCallSign
    }

    public init(registration: String, number: String, date: String, aircraftType: String, atcCallSign: String) {
        self.registration = registration
        self.number = number
        self.date = date
        self.aircraftType = aircraftType
        self.atcCallSign = atcCallSign
    }
}

// MARK: - AvioBookSchedule
public struct AvioBookSchedule: Codable {
    public let std: Date
    public let etot: Date
    public let eldt: Date
    public let sta: Date
    public let eta: Date

    public enum CodingKeys: String, CodingKey {
        case std
        case etot
        case eldt
        case sta
        case eta
    }

    public init(std: Date, etot: Date, eldt: Date, sta: Date, eta: Date) {
        self.std = std
        self.etot = etot
        self.eldt = eldt
        self.sta = sta
        self.eta = eta
    }
}

// MARK: - AvioBookUnits
public struct AvioBookUnits: Codable {
    public let fuel: String
    public let speed: String

    public enum CodingKeys: String, CodingKey {
        case fuel
        case speed
    }

    public init(fuel: String, speed: String) {
        self.fuel = fuel
        self.speed = speed
    }
}

// MARK: - AvioBookWeight
public struct AvioBookWeight: Codable {
    public let dow: Int
    public let lw: Int
    public let payload: Int
    public let rmpw: Int
    public let tow: Int
    public let zfw: Int
    public let mzfw: Int
    public let mtow: Int
    public let mlw: Int

    public enum CodingKeys: String, CodingKey {
        case dow
        case lw
        case payload
        case rmpw
        case tow
        case zfw
        case mzfw
        case mtow
        case mlw
    }

    public init(dow: Int, lw: Int, payload: Int, rmpw: Int, tow: Int, zfw: Int, mzfw: Int, mtow: Int, mlw: Int) {
        self.dow = dow
        self.lw = lw
        self.payload = payload
        self.rmpw = rmpw
        self.tow = tow
        self.zfw = zfw
        self.mzfw = mzfw
        self.mtow = mtow
        self.mlw = mlw
    }
}
