//
//  extension+UiButton.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 09/03/2024.
//

import UIKit
// MARK: - UIButton
extension UIButton{
    func setUpLayer(size: CGFloat,borderColor: CGColor,borderWidth: CGFloat){
        self.layer.cornerRadius = size
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
    func setUpShadow(color: UIColor = .darkGray,opacity: Float = 0.3){
        self.layer.cornerRadius = 10
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.backgroundColor = .white
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = nil
    }
    func makeCircle(){
        self.layer.cornerRadius = self.frame.height/2
    }
}
// for btn animation
extension UIButton {
    func ForBtnBig( DoThis: @escaping (() ->())){
        // This For Create Animation For Button
        self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        // Set duration
        UIView.animate(withDuration: 1.5, delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(4.0),
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: {
            self.transform = CGAffineTransform.identity
            // This For add action after seconds ---* for show animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7, execute: {
                DoThis()
            })},completion: nil)
    }
}
