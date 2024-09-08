//
//  KeyManager.swift
//  KeychainSwiftDemo
//
//  Created by Jonni Akesson on 2024-09-09.
//

import Foundation
import KeychainSwift

class KeyManager {
    static let shared = KeyManager() // Singleton instance
    
    private let keychain = KeychainSwift()
    private let key = "user_password"
    
    private init() {
        keychain.synchronizable = true // Ensures data is shared across devices
    }
    
    // Function to save a password in Keychain
    func savePassword(_ password: String) {
        keychain.set(password, forKey: key)
    }
    
    // Function to retrieve a password from Keychain
    func getPassword() -> String? {
        return keychain.get(key)
    }
    
    // Function to delete the saved password
    func deletePassword() {
        keychain.delete(key)
    }
}
