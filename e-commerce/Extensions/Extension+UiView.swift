//
//  Extension+UiView.swift
//  RoomChatApp
//
//  Created by KhaleD HuSsien on 16/09/2022.
//

import Foundation
import UIKit

extension UIView{
    func addLayer(cornerRadius: CGFloat = 10,shadowColor: UIColor = UIColor.lightGray,shadowOffsetWidth: CGFloat = 0 ,shadowOffsetHeight: CGFloat = 0, shadowOpacity: CGFloat = 0.0){
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = Float(shadowOpacity)
    }
}
