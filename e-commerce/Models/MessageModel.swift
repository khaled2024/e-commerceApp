//
//  MessageModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 25/02/2024.
//

import Foundation

enum MessageType {
    case inComing
    case outComing
}
struct MessageModel {
    let messageText: String
    let type: MessageType
}
var messages = [
    MessageModel(messageText: "Hello khaled", type: .outComing),
    MessageModel(messageText: "hi", type: .outComing),
    MessageModel(messageText: "Hello khaled Hello khaled Hello khaled Hello khaled Hello khaled", type: .inComing),
    MessageModel(messageText: "Hello khaled", type: .outComing),
    MessageModel(messageText: "Hello khaled", type: .outComing),
    MessageModel(messageText: "how are you ?", type: .inComing),
    MessageModel(messageText: "fine it is okay :-", type: .inComing),
    MessageModel(messageText: "Hello khaled", type: .inComing)
    
    
]
