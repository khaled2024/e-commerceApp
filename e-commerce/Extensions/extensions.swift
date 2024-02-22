//
//  extensions.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit

extension UIView{
    func setUpLayers(){
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.systemOrange.cgColor
        self.layer.shadowRadius = 7
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    func setUpLayerForCell(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.systemOrange.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
}
extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        
        layer.mask = maskLayer
    }
}
extension UIButton{
    func setUpLayer(size: CGFloat,borderColor: CGColor,borderWidth: CGFloat){
        self.layer.cornerRadius = size
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    func setUpShadow(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.systemYellow.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.backgroundColor = .white
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = nil
    }
}
