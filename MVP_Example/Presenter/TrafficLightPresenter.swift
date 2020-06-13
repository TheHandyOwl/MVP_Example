//
//  TrafficLightPresenter.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

protocol TrafficLightViewDelegate : NSObjectProtocol {
    func displayTrafficLight(description:(String))
}

class TrafficLightPresenter {

    private var trafficLightService : TrafficLightService?
    private var trafficLightViewDelegate : TrafficLightViewDelegate?
    
    init() {
        self.trafficLightService = TrafficLightService()
    }

    func setViewDelegate(trafficLightViewDelegate delegate: UIViewController) {
        trafficLightViewDelegate = delegate as? TrafficLightViewDelegate
    }

    func trafficLightColorSelected (color: String) {
        trafficLightViewDelegate?.displayTrafficLight(description: color)
    }
    
}

