// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avioBookWeatherRoot = try? JSONDecoder().decode(AvioBookWeatherRoot.self, from: jsonData)

import Foundation

// MARK: - AvioBookWeatherRoot
public struct AvioBookWeatherRoot: Codable {
    public let limit: Int
    public let offset: Int
    public let total: Int
    public let items: [AvioBookWeatherItem]

    public enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }

    public init(limit: Int, offset: Int, total: Int, items: [AvioBookWeatherItem]) {
        self.limit = limit
        self.offset = offset
        self.total = total
        self.items = items
    }
}

// MARK: - AvioBookWeatherItem
public struct AvioBookWeatherItem: Codable {
    public let icao: String
    public let iata: String
    public let weather: AvioBookWeatherWeather

    public enum CodingKeys: String, CodingKey {
        case icao
        case iata
        case weather
    }

    public init(icao: String, iata: String, weather: AvioBookWeatherWeather) {
        self.icao = icao
        self.iata = iata
        self.weather = weather
    }
}

// MARK: - AvioBookWeatherWeather
public struct AvioBookWeatherWeather: Codable {
    public let metar: String
    public let parsedMetar: AvioBookWeatherWeatherParsedMetar
    public let isMetarApplicable: Bool
    public let historicalMetars: [AvioBookWeatherHistoricalMetar]
    public let applicableTaf: AvioBookWeatherApplicableTaf
    public let ftTaf: String
    public let parsedFtTaf: AvioBookWeatherParsedFtTaf

    public enum CodingKeys: String, CodingKey {
        case metar
        case parsedMetar
        case isMetarApplicable
        case historicalMetars
        case applicableTaf
        case ftTaf
        case parsedFtTaf
    }

    public init(metar: String, parsedMetar: AvioBookWeatherWeatherParsedMetar, isMetarApplicable: Bool, historicalMetars: [AvioBookWeatherHistoricalMetar], applicableTaf: AvioBookWeatherApplicableTaf, ftTaf: String, parsedFtTaf: AvioBookWeatherParsedFtTaf) {
        self.metar = metar
        self.parsedMetar = parsedMetar
        self.isMetarApplicable = isMetarApplicable
        self.historicalMetars = historicalMetars
        self.applicableTaf = applicableTaf
        self.ftTaf = ftTaf
        self.parsedFtTaf = parsedFtTaf
    }
}

public enum AvioBookWeatherApplicableTaf: String, Codable {
    case ftTaf = "FT_TAF"
}

// MARK: - AvioBookWeatherHistoricalMetar
public struct AvioBookWeatherHistoricalMetar: Codable {
    public let modifiedAt: String
    public let metar: String
    public let parsedMetar: AvioBookWeatherHistoricalMetarParsedMetar

    public enum CodingKeys: String, CodingKey {
        case modifiedAt
        case metar
        case parsedMetar
    }

    public init(modifiedAt: String, metar: String, parsedMetar: AvioBookWeatherHistoricalMetarParsedMetar) {
        self.modifiedAt = modifiedAt
        self.metar = metar
        self.parsedMetar = parsedMetar
    }
}

// MARK: - AvioBookWeatherHistoricalMetarParsedMetar
public struct AvioBookWeatherHistoricalMetarParsedMetar: Codable {
    public let issuedAt: Date
    public let warningLevel: AvioBookWeatherWarningLevel
    public let annotated: String
    public let wind: AvioBookWeatherWind
    public let airTemperature: AvioBookWeatherAirTemperature
    public let skyConditions: [AvioBookWeatherSkyCondition]
    public let prevailingVisibility: AvioBookWeatherPrevailingVisibility
    public let qnh: AvioBookWeatherQnh
    public let flightRule: AvioBookWeatherFlightRule
    public let phenomena: String?
    public let minimumVisibility: AvioBookWeatherMinimumVisibility?

    public enum CodingKeys: String, CodingKey {
        case issuedAt
        case warningLevel
        case annotated
        case wind
        case airTemperature
        case skyConditions
        case prevailingVisibility
        case qnh
        case flightRule
        case phenomena
        case minimumVisibility
    }

    public init(issuedAt: Date, warningLevel: AvioBookWeatherWarningLevel, annotated: String, wind: AvioBookWeatherWind, airTemperature: AvioBookWeatherAirTemperature, skyConditions: [AvioBookWeatherSkyCondition], prevailingVisibility: AvioBookWeatherPrevailingVisibility, qnh: AvioBookWeatherQnh, flightRule: AvioBookWeatherFlightRule, phenomena: String?, minimumVisibility: AvioBookWeatherMinimumVisibility?) {
        self.issuedAt = issuedAt
        self.warningLevel = warningLevel
        self.annotated = annotated
        self.wind = wind
        self.airTemperature = airTemperature
        self.skyConditions = skyConditions
        self.prevailingVisibility = prevailingVisibility
        self.qnh = qnh
        self.flightRule = flightRule
        self.phenomena = phenomena
        self.minimumVisibility = minimumVisibility
    }
}

// MARK: - AvioBookWeatherAirTemperature
public struct AvioBookWeatherAirTemperature: Codable {
    public let value: Int
    public let unit: AvioBookWeatherAirTemperatureUnit

    public enum CodingKeys: String, CodingKey {
        case value
        case unit
    }

    public init(value: Int, unit: AvioBookWeatherAirTemperatureUnit) {
        self.value = value
        self.unit = unit
    }
}

public enum AvioBookWeatherAirTemperatureUnit: String, Codable {
    case c = "C"
}

public enum AvioBookWeatherFlightRule: String, Codable {
    case ifr = "IFR"
    case lifr = "LIFR"
    case mvfr = "MVFR"
    case vfr = "VFR"
}

// MARK: - AvioBookWeatherMinimumVisibility
public struct AvioBookWeatherMinimumVisibility: Codable {
    public let boundary: AvioBookWeatherBoundary
    public let value: Int
    public let unit: AvioBookWeatherMinimumVisibilityUnit
    public let direction: String?

    public enum CodingKeys: String, CodingKey {
        case boundary
        case value
        case unit
        case direction
    }

    public init(boundary: AvioBookWeatherBoundary, value: Int, unit: AvioBookWeatherMinimumVisibilityUnit, direction: String?) {
        self.boundary = boundary
        self.value = value
        self.unit = unit
        self.direction = direction
    }
}

public enum AvioBookWeatherBoundary: String, Codable {
    case atLeast = "AT_LEAST"
}

public enum AvioBookWeatherMinimumVisibilityUnit: String, Codable {
    case m = "M"
    case sm = "SM"
}

// MARK: - AvioBookWeatherPrevailingVisibility
public struct AvioBookWeatherPrevailingVisibility: Codable {
    public let boundary: AvioBookWeatherBoundary
    public let value: Double
    public let unit: AvioBookWeatherMinimumVisibilityUnit

    public enum CodingKeys: String, CodingKey {
        case boundary
        case value
        case unit
    }

    public init(boundary: AvioBookWeatherBoundary, value: Double, unit: AvioBookWeatherMinimumVisibilityUnit) {
        self.boundary = boundary
        self.value = value
        self.unit = unit
    }
}

// MARK: - AvioBookWeatherQnh
public struct AvioBookWeatherQnh: Codable {
    public let value: Int
    public let unit: AvioBookWeatherQnhUnit

    public enum CodingKeys: String, CodingKey {
        case value
        case unit
    }

    public init(value: Int, unit: AvioBookWeatherQnhUnit) {
        self.value = value
        self.unit = unit
    }
}

public enum AvioBookWeatherQnhUnit: String, Codable {
    case hpa = "HPA"
}

// MARK: - AvioBookWeatherSkyCondition
public struct AvioBookWeatherSkyCondition: Codable {
    public let cover: AvioBookWeatherCover
    public let height: Int?

    public enum CodingKeys: String, CodingKey {
        case cover
        case height
    }

    public init(cover: AvioBookWeatherCover, height: Int?) {
        self.cover = cover
        self.height = height
    }
}

public enum AvioBookWeatherCover: String, Codable {
    case bkn = "BKN"
    case clr = "CLR"
    case few = "FEW"
    case ncd = "NCD"
    case nsc = "NSC"
    case ovc = "OVC"
    case sct = "SCT"
    case skc = "SKC"
    case vv = "VV"
}

public enum AvioBookWeatherWarningLevel: String, Codable {
    case caution = "CAUTION"
    case ok = "OK"
    case unreadable = "UNREADABLE"
    case warning = "WARNING"
}

// MARK: - AvioBookWeatherWind
public struct AvioBookWeatherWind: Codable {
    public let direction: Int?
    public let speed: Int
    public let unit: AvioBookWeatherWindUnit
    public let gust: Int?
    public let variableDirection1: Int?
    public let variableDirection2: Int?

    public enum CodingKeys: String, CodingKey {
        case direction
        case speed
        case unit
        case gust
        case variableDirection1
        case variableDirection2
    }

    public init(direction: Int?, speed: Int, unit: AvioBookWeatherWindUnit, gust: Int?, variableDirection1: Int?, variableDirection2: Int?) {
        self.direction = direction
        self.speed = speed
        self.unit = unit
        self.gust = gust
        self.variableDirection1 = variableDirection1
        self.variableDirection2 = variableDirection2
    }
}

public enum AvioBookWeatherWindUnit: String, Codable {
    case kt = "KT"
}

// MARK: - AvioBookWeatherParsedFtTaf
public struct AvioBookWeatherParsedFtTaf: Codable {
    public let issuedAt: Date
    public let warningLevel: AvioBookWeatherWarningLevel
    public let annotated: String
    public let validFrom: Date
    public let validTo: Date

    public enum CodingKeys: String, CodingKey {
        case issuedAt
        case warningLevel
        case annotated
        case validFrom
        case validTo
    }

    public init(issuedAt: Date, warningLevel: AvioBookWeatherWarningLevel, annotated: String, validFrom: Date, validTo: Date) {
        self.issuedAt = issuedAt
        self.warningLevel = warningLevel
        self.annotated = annotated
        self.validFrom = validFrom
        self.validTo = validTo
    }
}

// MARK: - AvioBookWeatherWeatherParsedMetar
public struct AvioBookWeatherWeatherParsedMetar: Codable {
    public let issuedAt: Date
    public let warningLevel: AvioBookWeatherWarningLevel
    public let annotated: String
    public let wind: AvioBookWeatherWind
    public let airTemperature: AvioBookWeatherAirTemperature
    public let skyConditions: [AvioBookWeatherSkyCondition]
    public let prevailingVisibility: AvioBookWeatherPrevailingVisibility
    public let qnh: AvioBookWeatherQnh
    public let flightRule: AvioBookWeatherFlightRule
    public let phenomena: String?

    public enum CodingKeys: String, CodingKey {
        case issuedAt
        case warningLevel
        case annotated
        case wind
        case airTemperature
        case skyConditions
        case prevailingVisibility
        case qnh
        case flightRule
        case phenomena
    }

    public init(issuedAt: Date, warningLevel: AvioBookWeatherWarningLevel, annotated: String, wind: AvioBookWeatherWind, airTemperature: AvioBookWeatherAirTemperature, skyConditions: [AvioBookWeatherSkyCondition], prevailingVisibility: AvioBookWeatherPrevailingVisibility, qnh: AvioBookWeatherQnh, flightRule: AvioBookWeatherFlightRule, phenomena: String?) {
        self.issuedAt = issuedAt
        self.warningLevel = warningLevel
        self.annotated = annotated
        self.wind = wind
        self.airTemperature = airTemperature
        self.skyConditions = skyConditions
        self.prevailingVisibility = prevailingVisibility
        self.qnh = qnh
        self.flightRule = flightRule
        self.phenomena = phenomena
    }
}
