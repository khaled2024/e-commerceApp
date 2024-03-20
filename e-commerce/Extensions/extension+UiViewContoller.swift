//
//  extension+UiViewContoller.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import UIKit
//static let identifier = String(describing: MarketDetailsViewController.self)
extension UIViewController{
    func  identifier()-> String{
        return String(describing: self.self)
    }
}
// toast
extension UIViewController{
    func showToast(message: String,font: UIFont){
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y:  self.view.frame.size.height/5 , width: 200, height: 40))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = .white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 15
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseIn) {
            toastLabel.alpha = 0.0
        } completion: { (isCompleted) in
            toastLabel.removeFromSuperview()
        }

    }
}
