//
//  TrafficLightService.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    func getTrafficLight( color: TrafficLightModel.ColorAvailable, callback: (TrafficLightModel?) -> Void ) {
        let trafficLights = [
            TrafficLightModel(colorName: .Red, description: "Stop"),
            TrafficLightModel(colorName: .Yellow, description: "Keep calm!"),
            TrafficLightModel(colorName: .Green, description: "Go")
        ]
        
        if let foundTrafficLight = trafficLights.filter({ $0.colorName == color }).first {
            callback(foundTrafficLight)
        } else {
            callback(nil)
        }
    }
    
}
