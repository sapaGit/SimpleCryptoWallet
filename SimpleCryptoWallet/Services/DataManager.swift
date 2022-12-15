//
//  DataManager.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setLoggedIn(key: String, with status: Bool) {
        userDefaults.set(status, forKey: key)
    }
    func getLoggedIn(key: String) -> Bool {
        UserDefaults.standard.value(forKey: key) as? Bool ?? false
    }
}
