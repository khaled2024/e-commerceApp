//
//  OnboardingCollectionViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 22/02/2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imageCell: UIView!
    
    var buttonTapped: (()->())?
    
    
    func config(with slide: Slide){
        self.nextBtn.setUpLayer(size: 15, borderColor: slide.buttonColor.cgColor, borderWidth: 1)
        self.nextBtn.setTitle(slide.buttonTitle, for: .normal)
        self.nextBtn.backgroundColor = slide.buttonColor
        self.descriptionLbl.text = slide.title
    }
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        buttonTapped?()
    }
}
