//
//  StorageManager.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import Foundation

class StorageManager {
    enum Key: String{
        case onboardingSeen
    }
    func isOnboardingSeen()-> Bool{
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    func setOnboardingSeen(){
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    func resetOnboardingSeen(){
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
}
