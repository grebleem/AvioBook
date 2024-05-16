// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let avioBookUserDetails = try? JSONDecoder().decode(AvioBookUserDetails.self, from: jsonData)

import Foundation

// MARK: - AvioBookUserDetails
public struct AvioBookUserDetails: Codable {
    public let id: String
    public let firstName: String
    public let lastName: String
    public let credentials: AvioBookCredentials
    public let organization: String
    public let systemRole: String
    public let locked: Bool
    public let roles: [AvioBookRole]
    public let active: Bool
    public let archived: Bool
    public let createdAt: Date
    public let submittedAt: Date
    public let modifiedAt: Date
    public let function: String

    public enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case credentials
        case organization
        case systemRole
        case locked
        case roles
        case active
        case archived
        case createdAt
        case submittedAt
        case modifiedAt
        case function
    }

    public init(id: String, firstName: String, lastName: String, credentials: AvioBookCredentials, organization: String, systemRole: String, locked: Bool, roles: [AvioBookRole], active: Bool, archived: Bool, createdAt: Date, submittedAt: Date, modifiedAt: Date, function: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.credentials = credentials
        self.organization = organization
        self.systemRole = systemRole
        self.locked = locked
        self.roles = roles
        self.active = active
        self.archived = archived
        self.createdAt = createdAt
        self.submittedAt = submittedAt
        self.modifiedAt = modifiedAt
        self.function = function
    }
}

// MARK: - AvioBookCredentials
public struct AvioBookCredentials: Codable {
    public let username: String

    public enum CodingKeys: String, CodingKey {
        case username
    }

    public init(username: String) {
        self.username = username
    }
}

// MARK: - AvioBookRole
public struct AvioBookRole: Codable {
    public let id: String
    public let type: String
    public let name: String
    public let description: String
    public let organization: String
    public let archived: Bool
    public let createdAt: Date
    public let modifiedAt: Date
    public let permissions: [String]?

    public enum CodingKeys: String, CodingKey {
        case id
        case type
        case name
        case description
        case organization
        case archived
        case createdAt
        case modifiedAt
        case permissions
    }

    public init(id: String, type: String, name: String, description: String, organization: String, archived: Bool, createdAt: Date, modifiedAt: Date, permissions: [String]?) {
        self.id = id
        self.type = type
        self.name = name
        self.description = description
        self.organization = organization
        self.archived = archived
        self.createdAt = createdAt
        self.modifiedAt = modifiedAt
        self.permissions = permissions
    }
}
