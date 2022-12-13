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
    
    var isLoggedIn = false
}
