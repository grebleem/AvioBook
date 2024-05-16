//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 09/05/2024.
//

import Foundation
import OSLog

struct AvioBookEndpoint {
    static let avioBookVersion = "23_3"
    let path: String
    let queryItems: [URLQueryItem]?
}

extension AvioBookEndpoint {
    
    // https://aviobook.klm.com/Aviobook/efb/rest/v1.0/legs/KL1575-2022-06-13-AMS/ofps/22%201101Z/airportNotams
    static func getAirportNotams(flightId: String, version: String) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/Aviobook/efb/rest/v1.0/legs/\(flightId)/ofps/\(version)/airportNotams",
            queryItems: nil)
    }
    
    static func getFirNotams(flightId: String, version: String) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/Aviobook/efb/rest/v1.0/legs/\(flightId)/ofps/\(version)/firNotams",
            queryItems: nil)
    }
    /*
     query=(archived==false;(((departure.airport.icao==*BCN*,departure.airport.iata==*BCN*),(destination.airport.icao==*BCN*,destination.airport.iata==*BCN*),flightNumber==*BCN*,aircraft.registration==*BCN*);(schedule.std=gt=2024-05-04T03:58:11Z;schedule.std=lt=2024-05-07T01:58:11Z)))
     
     */
    static func doFlightSearch(query: String) -> AvioBookEndpoint {
        //let showLanded: String = (landed ? "" : "schedule.sta=ge=\(date.ISO8601Format());")
        // print(showLanded)
        let date = Date.now
        guard let startDate = Calendar.current.date(byAdding: .hour, value: -12, to: date)?.ISO8601Format() else { return AvioBookEndpoint(path: "", queryItems: nil) }
        print(startDate)
        guard let endDate = Calendar.current.date(byAdding: .day, value: +2, to: date)?.ISO8601Format()  else { return AvioBookEndpoint(path: "", queryItems: nil) }
        print(endDate)
        return AvioBookEndpoint(
            path: "/core/api/leg/\(avioBookVersion)/legs",
            queryItems: [
                URLQueryItem(name: "query", value: "(archived==false;(((departure.airport.icao==*\(query)*,departure.airport.iata==*\(query)*),(destination.airport.icao==*\(query)*,destination.airport.iata==*\(query)*),flightNumber==*\(query)*,aircraft.registration==*\(query)*);(schedule.std=gt=\(startDate);schedule.std=lt=\(endDate))))"),
                URLQueryItem(name: "limit", value: "25"),
                URLQueryItem(name: "offset", value: "0"),
                URLQueryItem(name: "sort", value: "schedule.std:asc,flightNumber:asc"),
                URLQueryItem(name: "only-qualified", value: "true")
            ])
    }
    
    
    /*
     https://aviobook.klm.com/core/api/leg/23_3/legs?query=(archived==false;(id==KL1521-2024-05-05-EHAM))&sort=schedule.std:asc,flightNumber:asc
     
     (archived==false;(id==KL1521-2024-05-05-EHAM))
     
     */
    static func getFlightItemById(flightId: String) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/core/api/leg/\(avioBookVersion)/legs",
            queryItems: [
                URLQueryItem(name: "query", value: "(archived==false;(id==\(flightId)))"),
                URLQueryItem(name: "limit", value: "25"),
                URLQueryItem(name: "offset", value: "0"),
                URLQueryItem(name: "sort", value: "schedule.std:asc,flightNumber:asc"),
                URLQueryItem(name: "only-qualified", value: "true")
            ])
    }
    /*
     https://avio.klm.com/idp/users/klm66300
     */
    static func getUserDetails(_ psn: String) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/idp/users/klm\(psn.suffix(5))",
            queryItems: []
        )
    }
    /*
     query: (archived==false;((crew.id==klm66300,crew.id==k066300);((schedule.std=gt=2024-05-04T05:03:55Z;schedule.std=lt=2024-05-07T03:03:55Z))))
     */
    
    /*
     https://avio.klm.com/idp/refresh?refreshToken=eyJraWQiOiI3NDkxNTQ3MDgiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE3MTUwNTg2NTgsInRva2VuIjoiODQwYzZjYmMtZjNiMS00YmIwLThjMzUtMmY5ZWEzOWRhYmQ2In0.jvXOZ_XN6IuksxwO25IiMWFaSn-qs0gTl6eQjcnq1iI7gLRDe4LV8gC1DpU8gZD6k8ZGQ1Ze4PIZs6uRBpx2gIOiKX_QmqvB5-i3vgjSGxgrBkdj74wkWFnwFOo2HYy12AMYAno5xnNxAeF7pKhInt48sJMA5bTZo56OYUe7zc5c38AoZokmqYvORLjJYnb02dr6hGifejPmbQ1YI9ASf21B67Qy6b6MZQL9Zf-wdV0D6zvdUAXnfHTdPHQPMg9d3kMXX8wUX8Jal6ehZwUx6EH09HZi0Vx5xGM02fAuGNFLYye6pGFT-C1Tmygx-_MDu7WWVybBTwJX5e4dWOZ0Tg
     */
    static func refreshToken(refreshToken: String?) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/idp/refresh",
            queryItems: [
                URLQueryItem(name: "refreshToken", value: refreshToken)
            ]
        )
    }
    
    static func getDefaultFlight() throws -> AvioBookEndpoint {

        let date = Date.now
        guard let startDate = Calendar.current.date(byAdding: .hour, value: -12, to: date)?.ISO8601Format() else { return AvioBookEndpoint(path: "", queryItems: nil) }
        guard let endDate = Calendar.current.date(byAdding: .day, value: +3, to: date)?.ISO8601Format()  else { return AvioBookEndpoint(path: "", queryItems: nil) }
        
        let userDefaults = UserDefaults.standard
        
        guard let userName = userDefaults.string(forKey: UserDefaults.userName) else { 
            print("No UserName")
            throw AvioBookError.requestError }
        guard let klmID = userDefaults.string(forKey: UserDefaults.klmID) else { 
            print("No klmID")
            throw AvioBookError.requestError  }
        
        return AvioBookEndpoint(
            path: "/core/api/leg/23_3/legs",
            queryItems: [
                URLQueryItem(name: "query", value: "(archived==false;((crew.id==\(klmID),crew.id==\(userName));((schedule.std=gt=\(startDate);schedule.std=lt=\(endDate)))))"),
                URLQueryItem(name: "limit", value: "25"),
                URLQueryItem(name: "offset", value: "0"),
                URLQueryItem(name: "sort", value: "schedule.std:asc,flightNumber:asc"),
                URLQueryItem(name: "only-qualified", value: "true")
            ])
    }
    /*
     
     https://aviobook.klm.com/core/api/leg/20_1/legs?query=(archived==false;((crew.id==klm66300,crew.id==k066300),(id==KL1229-2022-07-16-AMS)))&
     limit=25&
     offset=0&
     sort=schedule.std:asc,flightNumber:asc&
     only-qualified=true
     
     https://aviobook.klm.com/core/api/leg/20_1/legs?query=(archived==false;((crew.id==klm66300,crew.id==k066300),(id==KL1665-2022-07-16-AMS)))&limit=25&offset=0&sort=schedule.std:asc,flightNumber:asc&only-qualified=true
     https://aviobook.klm.com/core/api/leg/20_1/legs?query=(archived%3D%3Dfalse;((crew.id%3D%3Dklm66300,crew.id%3D%3Dk066300),(id%3D%3DKL1229-2022-07-16-AMS))&limit=25&offset=0&sort=schedule.std:asc,flightNumber:asc&only-qualified=true
     
     https://aviobook.klm.com/core/api/leg/20_1/legs?query=(archived==false;((crew.id==klm66300,crew.id==k066300)))&limit=25&offset=0&sort=schedule.std:asc,flightNumber:asc&only-qualified=true
     
     
     */
    
    
    /*
     https://aviobook.klm.com/Aviobook/efb/rest/v1.0/airportsWeather?icao=EHAM&icao=LFTM&icao=LIPZ&icao=LIPX&icao=LIPE&icao=LIPH&icao=LIMC&icao=LIPX&icao=EBBR&icao=EBCI&icao=EBLG&icao=EBOS&icao=EDDF&icao=EDDG&icao=EDDK&icao=EDDL&icao=EDDM&icao=EDDN&icao=EDDS&icao=EDDV&icao=EDDW&icao=EDFH&icao=EDSB&icao=EGSH&icao=EHBK&icao=EHEH&icao=EHGG&icao=EHRD&icao=ELLX&icao=LFQQ&icao=LFSB&icao=LFST&icao=LIME&icao=LIMF&icao=LIMJ&icao=LIML&icao=LIPQ&icao=LIRP&icao=LJLJ&icao=LSZH
     */
    
    /*
     https://avio.klm.com/core/api/leg/22_1/legs/KL611-2024-01-26-EHAM
     */
    
    static func getLegData(legId: String) -> AvioBookEndpoint {
        return AvioBookEndpoint(
            path: "/core/api/leg/22_1/legs/\(legId)",
            queryItems: []
        )
    }
    
    static func getWeather(airports: [String]) -> AvioBookEndpoint {
        let query = "((".appending(
            airports.compactMap({
                "icao==".appending(
                    $0.uppercased()
                )
            }).joined(separator: ",")
        ).appending("))")
        
        return AvioBookEndpoint(
            path: "/core/api/weather/20_1_1/airports",
            queryItems: [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "limit", value: String(airports.count)),
                URLQueryItem(name: "offset", value: "0")
            ])
    }
    
    static func getFlightPlan(flightLeg: String) -> AvioBookEndpoint {
        
        return AvioBookEndpoint(
            path: "/core/api/ofp/22_1/ofps",
            queryItems: [
                URLQueryItem(name: "download-event", value: "true"),
                //URLQueryItem(name: "fields", value: "metadata"),
                URLQueryItem(name: "limit", value: "1"),
                URLQueryItem(name: "offset", value: "0"),
                URLQueryItem(name: "query", value: "((metadata.leg==\(flightLeg));summary.status!=NOT_RELEASED)"),
                URLQueryItem(name: "sort", value: "metadata.createdAt:desc")
            ])
    }
    
    /*
     let stringDate = DateFormatter.linkDate.string(from: Date.now)
     
     guard let urlCDM = URL(string: "https://aviobook.klm.com/Aviobook/efb/rest/v1.0/legs/\(flightNumber)-\(stringDate)-AMS/cdm") else { return }
     */
    
    static func getCdm(flightNumber: String) -> AvioBookEndpoint {
        
        let stringDate = DateFormatter.linkDate.string(from: Date.now)
        return AvioBookEndpoint(
            path: "/Aviobook/efb/rest/v1.0/legs/\(flightNumber)-\(stringDate)-AMS/cdm",
            queryItems: nil
            )
    }
    
    // https://aviobook.klm.com/core/api/leg/19_2/submission/6343372
    static func submission(id: String) -> AvioBookEndpoint {
        
        return AvioBookEndpoint(
            path: "/core/api/leg/19_2/submission/\(id)",
            queryItems: nil)
    }
}


extension AvioBookEndpoint {
    var url: URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "aviobook.klm.com"
        component.path = path
        component.queryItems = queryItems
        return component.url
    }
    
    var request: URLRequest? {
        guard let url = url else {
            return nil
        }
        
        let avioToken = UserDefaults.standard.string(forKey: UserDefaults.avioToken) ?? ""
        Logger.aviobook.debugAviobook("\(url.absoluteString)")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("avio.klm.com", forHTTPHeaderField: "Host")
        request.addValue(avioToken, forHTTPHeaderField: "Avio-Token")
        return request
    }
    
    var requestToken: URLRequest? {
        
        guard let url = url else {
            return nil
        }
        
        Logger.aviobook.debugAviobook("\(url.absoluteString)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("avio.klm.com", forHTTPHeaderField: "Host")
        return request
    }
}

