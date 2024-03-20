//
//  StorageManager.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 24/02/2024.
//

import Foundation

class StorageManager {
    let defaults = UserDefaults.standard
    enum Key: String{
        case onboardingSeen
        case isUserLogin = "UserLogin"
        case isAdminLogin = "AdminLogin"
    }
    // for
    func isOnboardingSeen()-> Bool{
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    func setOnboardingSeen(){
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    func resetOnboardingSeen(){
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
    
    // For User Login
    func saveUserLogging(_ isLogging: Bool){
        defaults.set(isLogging, forKey: Key.isUserLogin.rawValue)
    }
    func isUserLogging()-> Bool{
        defaults.bool(forKey: Key.isUserLogin.rawValue)
    }
    func resetUserLogging(){
        defaults.set(false, forKey: Key.isUserLogin.rawValue)
    }
    // For Admin Login
    func saveAdminLogging(_ isLogging: Bool){
        defaults.set(isLogging, forKey: Key.isAdminLogin.rawValue)
    }
    func isAdminLogging()-> Bool{
        defaults.bool(forKey: Key.isAdminLogin.rawValue)
    }
    func resetAdminLogging(){
        defaults.set(false, forKey: Key.isAdminLogin.rawValue)
    }
}
