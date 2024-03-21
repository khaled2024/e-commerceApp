//
//  UserCartViewModel.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 21/03/2024.
//

import UIKit

protocol UserCartViewModelDelegation: AnyObject {
    func showToast(message: String,font: UIFont)
}

final class UserCartViewModel{
    let navManager = NavigationManager()
    let storageManager = StorageManager()
    weak var delegate: UserCartViewModelDelegation?
    
}
