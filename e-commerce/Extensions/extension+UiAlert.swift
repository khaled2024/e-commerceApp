//
//  extension+UiAlert.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 19/03/2024.
//

import UIKit
extension UIAlertController {
    static func showAlert(title: String?, message: String?, actionTitle: String = "OK", handler: ((UIAlertAction) -> Void)? = nil)-> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitle, style: .default, handler: handler)
        alertController.addAction(action)
        return alertController
        
    }
}
