//
//  PopupViewModel.swift
//  e-commerce
//  Created by KhaleD HuSsien on 21/03/2024.


import UIKit
protocol PopupViewModelDelegation: AnyObject {
    
}
final class PopupViewModel{
    weak var delegate: PopupViewModelDelegation?
    let navManager = NavigationManager()
    let storageManager = StorageManager()
    
    
    
}
