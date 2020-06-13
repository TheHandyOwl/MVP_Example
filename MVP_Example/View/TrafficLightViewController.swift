//
//  TrafficLightViewController.swift
//  MVP_Example
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController {

    @IBOutlet weak var redLightButton: UIButton!
    @IBOutlet weak var yellowLightButton: UIButton!
    @IBOutlet weak var greenLightButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var trafficLightPresenter : TrafficLightPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        trafficLightPresenter = TrafficLightPresenter()
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
        
        setupUI()
    }
    
    @IBAction func redLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(color: "Rojo")
    }
    
    @IBAction func yellowLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(color: "Amarillo")
    }
    
    @IBAction func greenLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(color: "Verde")
    }
    
}

extension TrafficLightViewController {
    func setupUI() {
        redLightButton.backgroundColor = .systemRed
        yellowLightButton.backgroundColor = .systemYellow
        greenLightButton.backgroundColor = .systemGreen
    }
}

extension TrafficLightViewController : TrafficLightViewDelegate {
    func displayTrafficLight(description: (String)) {
        descriptionLabel.text = description
    }
}
