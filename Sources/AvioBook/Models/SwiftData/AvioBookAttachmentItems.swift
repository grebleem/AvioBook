// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avioBookAtatchmentItemsRoot = try? JSONDecoder().decode(AvioBookAtatchmentItemsRoot.self, from: jsonData)

import Foundation

// MARK: - AvioBookAtatchmentItemsRoot
public struct AvioBookAttachmentItemsRoot: Codable {
    public let limit: Int
    public let offset: Int
    public let total: Int
    public let items: [AvioBookAtatchmentItem]

    public enum CodingKeys: String, CodingKey {
        case limit
        case offset
        case total
        case items
    }

    public init(limit: Int, offset: Int, total: Int, items: [AvioBookAtatchmentItem]) {
        self.limit = limit
        self.offset = offset
        self.total = total
        self.items = items
    }
}

// MARK: - AvioBookAtatchmentItem
public struct AvioBookAtatchmentItem: Codable {
    public let id: String
    public let title: String
    public let filename: String
    public let attachment: AvioBookAtatchmentAttachment
    public let receiver: [String]
    public let numberOfCopies: Int
    public let rule: AvioBookAtatchmentRule
    public let modifiedAt: String
    public let modifiedBy: String
    public let submittedAt: String
    public let submittedBy: String
    public let validFrom: Date?
    public let validTo: Date?

    public enum CodingKeys: String, CodingKey {
        case id
        case title
        case filename
        case attachment
        case receiver
        case numberOfCopies
        case rule
        case modifiedAt
        case modifiedBy
        case submittedAt
        case submittedBy
        case validFrom
        case validTo
    }

    public init(id: String, title: String, filename: String, attachment: AvioBookAtatchmentAttachment, receiver: [String], numberOfCopies: Int, rule: AvioBookAtatchmentRule, modifiedAt: String, modifiedBy: String, submittedAt: String, submittedBy: String, validFrom: Date?, validTo: Date?) {
        self.id = id
        self.title = title
        self.filename = filename
        self.attachment = attachment
        self.receiver = receiver
        self.numberOfCopies = numberOfCopies
        self.rule = rule
        self.modifiedAt = modifiedAt
        self.modifiedBy = modifiedBy
        self.submittedAt = submittedAt
        self.submittedBy = submittedBy
        self.validFrom = validFrom
        self.validTo = validTo
    }
}

// MARK: - AvioBookAtatchmentAttachment
public struct AvioBookAtatchmentAttachment: Codable {
    public let id: String
    public let contentType: String
    public let contentLength: Int

    public enum CodingKeys: String, CodingKey {
        case id
        case contentType
        case contentLength
    }

    public init(id: String, contentType: String, contentLength: Int) {
        self.id = id
        self.contentType = contentType
        self.contentLength = contentLength
    }
}

// MARK: - AvioBookAtatchmentRule
public struct AvioBookAtatchmentRule: Codable {
    public let legID: String?
    public let ofpID: String?
    public let flightNumbers: AvioBookAtatchmentAircraftTypes?
    public let aircraftTypes: AvioBookAtatchmentAircraftTypes?
    public let departuresOrDestinations: AvioBookAtatchmentAircraftTypes?

    public enum CodingKeys: String, CodingKey {
        case legID
        case ofpID
        case flightNumbers
        case aircraftTypes
        case departuresOrDestinations
    }

    public init(legID: String?, ofpID: String?, flightNumbers: AvioBookAtatchmentAircraftTypes?, aircraftTypes: AvioBookAtatchmentAircraftTypes?, departuresOrDestinations: AvioBookAtatchmentAircraftTypes?) {
        self.legID = legID
        self.ofpID = ofpID
        self.flightNumbers = flightNumbers
        self.aircraftTypes = aircraftTypes
        self.departuresOrDestinations = departuresOrDestinations
    }
}

// MARK: - AvioBookAtatchmentAircraftTypes
public struct AvioBookAtatchmentAircraftTypes: Codable {
    public let values: [String]
    public let type: String

    public enum CodingKeys: String, CodingKey {
        case values
        case type
    }

    public init(values: [String], type: String) {
        self.values = values
        self.type = type
    }
}
