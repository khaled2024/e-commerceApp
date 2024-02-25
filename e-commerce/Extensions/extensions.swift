//
//  extensions.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 26/01/2024.
//

import UIKit
extension UIImageView{
    func makeCircle(){
        self.layer.cornerRadius = self.frame.height/2
    }
}
// MARK: - UiView Extension
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
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11,*){
            var cornerMask = CACornerMask()
            if corners.contains(.topLeft){
                cornerMask.insert(.layerMinXMinYCorner)
            }
            if corners.contains(.topRight){
                cornerMask.insert(.layerMaxXMinYCorner)
            }
            if corners.contains(.bottomLeft){
                cornerMask.insert(.layerMinXMaxYCorner)
            }
            
            if corners.contains(.bottomRight){
                cornerMask.insert(.layerMaxXMaxYCorner)
            }
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = cornerMask
        }else{
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            
            self.layer.mask = maskLayer
        }
        
    }
    func setCorners(){
        self.layer.cornerRadius = 15
    }
    func setUpShadoww(){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.systemYellow.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.backgroundColor = .white
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = nil
    }
    // load view from nib
    func loadViewFromNib(nibName: String)-> UIView?{
        let nib = UINib(nibName: nibName, bundle: Bundle(for: type(of: self)))
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
// MARK: - UIButton
extension UIButton{
    func setUpLayer(size: CGFloat,borderColor: CGColor,borderWidth: CGFloat){
        self.layer.cornerRadius = size
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    func setUpShadow(color: UIColor){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.backgroundColor = .white
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = nil
    }
}
