//
//  UserChatRoomTableViewCell.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import UIKit

class UserChatRoomTableViewCell: UITableViewCell {
    // MARK: - outlets
    @IBOutlet weak var chatTextfield: UITextView!
    @IBOutlet weak var chatmessageView: UIView!
    @IBOutlet weak var chatstackView: UIStackView!
    
    static let identifier = String(describing: UserChatRoomTableViewCell.self)
    static func uiNib()->UINib{
        return UINib(nibName: UserChatRoomTableViewCell.identifier, bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpDesign()
    }
    // MARK: - functions
    func setUpDesign(){
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func config(message: MessageModel){
        self.chatTextfield.text = message.messageText
        if message.type == .inComing{
            chatstackView.alignment = .leading
            chatTextfield.textColor = .white
            chatmessageView.roundCorners(corners: [.topRight,.bottomLeft,.bottomRight], radius: 10)
        }else{
            chatstackView.alignment = .trailing
            chatTextfield.textColor = .black
            chatmessageView.roundCorners(corners: [.topLeft,.bottomLeft,.bottomRight], radius: 10)
        }
    }
}

