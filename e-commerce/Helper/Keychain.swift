//
//  Keychain.swift
//  e-commerce
//
//  Created by KhaleD HuSsien on 20/03/2024.
//

import UIKit
import Security

struct Keychain {
    
    // save data
    static func save(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecValueData: data
        ] as CFDictionary
        
        SecItemDelete(query)
        return SecItemAdd(query, nil)
    }
    
    // load data
    static func load(key: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        
        if status == errSecSuccess {
            return dataTypeRef as? Data
        }
        return nil
    }
    
    // delete data
    static func delete(key: String) -> OSStatus {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as CFDictionary
        return SecItemDelete(query)
    }
}
