//
//  TopNavView.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import UIKit

import UIKit

class TopNavView: UIView{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.roundCorners(corners: .allCorners, radius: 15)
    }
}

//final class TopNavView: UIView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commitInit()
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        commitInit()
//    }
//    func commitInit(){
//        let bundle = Bundle.init(for: TopNavView.self)
//        if let viewToAdded = bundle.loadNibNamed("TopNavView", owner: self, options: nil),let contentView = viewToAdded.first as? UIView{
//            addSubview(contentView)
//            contentView.frame = self.bounds
//            contentView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
//        }
//    }
//
//}
