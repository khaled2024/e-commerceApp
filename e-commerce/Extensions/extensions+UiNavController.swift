//
//  extensions+UiNavController.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 23/02/2024.
//

import Foundation
import UIKit
extension UINavigationController{
    public func setNavigationItemBackground(hidden: Bool){
        if hidden{
            self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationBar.shadowImage = UIImage()
            self.navigationBar.isTranslucent = true
            self.view.backgroundColor = UIColor.clear
        }else{
            self.navigationBar.isTranslucent = false
            self.view.backgroundColor = UIColor.white
        }
    }
}
