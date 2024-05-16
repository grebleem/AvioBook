//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 09/05/2024.
//

import Foundation

public enum AvioBookError: Error {
    case transferError
    case unauthorized
    case tokenRefresh
    case showHabile
    case requestError
}
