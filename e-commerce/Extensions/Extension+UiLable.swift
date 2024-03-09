//  Extension+UiLable.swift
//  Created by KhaleD HuSsien on 16/09/2022.
//

import UIKit
extension UILabel {
    func addCharacterSpacing(kernValue: Double = 2) {
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
}

