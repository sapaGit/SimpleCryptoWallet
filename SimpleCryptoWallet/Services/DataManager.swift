//
//  DataManager.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import Foundation

struct DataManager {
    static let shared = DataManager()
    private init() {}
    
    private let userDefaults = UserDefaults()
    
    func setLoggedIn(with status: Bool) {
        userDefaults.set(status, forKey: "loggedIn")
    }
    func getLoggedIn() -> Bool {
        UserDefaults.standard.value(forKey: "loggedIn") as? Bool ?? false
    }
}
