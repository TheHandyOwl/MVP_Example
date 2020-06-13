//
//  TrafficLightModel.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

struct TrafficLightModel {
    
    let colorName   : ColorAvailable
    let description : String
    
    enum ColorAvailable {
        case Red
        case Yellow
        case Green
    }
    
}

