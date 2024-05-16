//
//  SwiftUIView.swift
//  
//
//  Created by Bastiaan Meelberg on 10/05/2024.
//

import SwiftUI


public struct AvioBookWeatherFlightRuleLabel: View {
    var flightRule: AvioBookWeatherFlightRule
    var backGroundColor: Color
    public var body: some View {
        Text(flightRule.rawValue)
            .frame(maxWidth: 40)
            .fontWeight(.bold)
            .font(.caption2)
            .foregroundStyle(.white)
            .padding(.vertical, 1)
            .padding(.horizontal, 3)
            .background(backGroundColor)
            .cornerRadius(3)
        
    }
    
    public init(flightRule: AvioBookWeatherFlightRule) {
        self.flightRule = flightRule
        switch flightRule {
        case .ifr:
            self.backGroundColor = .red
        case .lifr:
            self.backGroundColor = .purple
        case .mvfr:
            self.backGroundColor = Color(red: 0.00, green: 0.33, blue: 0.57)
        case .vfr:
            self.backGroundColor = Color(red: 0.00, green: 0.55, blue: 0.01)
        }
    }
    
}

#Preview {
    return Group {
        AvioBookWeatherFlightRuleLabel(flightRule: .vfr)
        AvioBookWeatherFlightRuleLabel(flightRule: .lifr)
        AvioBookWeatherFlightRuleLabel(flightRule: .mvfr)
        AvioBookWeatherFlightRuleLabel(flightRule: .ifr)
    }
}
