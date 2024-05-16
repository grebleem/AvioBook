//
//  File.swift
//  
//
//  Created by Bastiaan Meelberg on 10/05/2024.
//

import Foundation
import OSLog

extension AvioBook {
    
    func debug(_ message: String) {
        Logger.aviobook.debugAviobook(message)
    }
}


extension Logger {
    /// Using your bundle identifier is a great way to ensure a unique identifier.
    private static var subsystem = Bundle.main.bundleIdentifier!

    static let aviobook = Logger(subsystem: subsystem, category: "aviobook")
}

extension Logger {
    func debugAviobook(_ message: String) {
        self.debug("✈ \(message)")
    }
}
