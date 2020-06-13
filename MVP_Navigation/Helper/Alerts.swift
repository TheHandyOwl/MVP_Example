//
//  Alerts.swift
//  MVP_TableView
//
//  Created by Carlos on 13/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class Alert {
    
    static func okAlert(viewController controller: UIViewController, title: String, body: String) {
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        controller.present(alert, animated: true)
    }
    
}
