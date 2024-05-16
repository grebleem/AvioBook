//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 09/05/2024.
//

import SwiftUI
import WebKit

public class AvioBook {
    public init() {
        
    }
    
    var debugLevel: Int = 0
    
    @AppStorage(UserDefaults.avioToken) var avioToken: String?
    @AppStorage(UserDefaults.klmID) var klmID: String?
    @AppStorage(UserDefaults.userName) var userName: String?
    
    public func getUserDetails() async throws -> AvioBookUserDetails? {
        let userDefaults = UserDefaults.standard
        guard let psn = userDefaults.string(forKey: "psn"),
              let request = AvioBookEndpoint.getUserDetails(psn).request
        else {
            throw AvioBookError.transferError
        }
        do {
            guard let data = try await loadAvioBookData(request, attempts: 3) else { return nil }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(AvioBookUserDetails.self, from: data)
        } catch {
            print(error)
            throw AvioBookError.transferError
        }
    }
    
    func loadAvioBookData(_ request: URLRequest, attempts: Int, retryDelay: Double = 0.3) async throws -> Data? {
        do {
            return try await loadAvioBookData(request)
        } catch AvioBookError.unauthorized {
            if attempts > 1 {
                try await Task.sleep(for: .milliseconds(Int(retryDelay * 1000)))
                let newToken = try await getNewToken()
                var newRequest = request
                
                newRequest.setValue(newToken, forHTTPHeaderField: "Avio-Token")
                return try await loadAvioBookData(newRequest, attempts: attempts - 1, retryDelay: retryDelay)
            } else {
                throw AvioBookError.unauthorized
            }
        }
    }
    
    // General function to load Data from AvioBook
    func loadAvioBookData(_ request: URLRequest) async throws -> Data {
            let (data, response) = try await URLSession.shared.data(for: request)
            let httpResponse = response as? HTTPURLResponse
            guard let statusCode = httpResponse?.statusCode else {
                throw AvioBookError.transferError
            }
            if statusCode == 401 {
                debug("Status 401")
                throw AvioBookError.unauthorized
            }
            if statusCode == 200 {
                debug("Status 200")
                return data
            }
        throw AvioBookError.transferError
    }
    
    func getNewToken() async throws -> String? {
        
        struct AvioToken: Codable {
            let accessToken: String
            let refreshToken: String
        }
        
        guard let refreshToken = getRefreshToken() else {
            throw AvioBookError.showHabile
        }
        
        //guard let avioRefresh else { throw AppError.tokenRefresh }
        guard let request = AvioBookEndpoint.refreshToken(refreshToken: refreshToken).requestToken else { throw AvioBookError.showHabile }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpResponse = response as? HTTPURLResponse
        
        if httpResponse?.statusCode == 200 {
            let decoder = JSONDecoder()
            let json = try decoder.decode(AvioToken.self, from: data)
            self.avioToken = json.accessToken
            return json.accessToken
        }
        
        return nil
    }
    
    func getRefreshToken() -> String? {
        guard let storage = HTTPCookieStorage.shared.cookies else { return nil }
        return storage.first(where: { $0.name == "AVIO-RefreshToken" })?.value
    }
}
