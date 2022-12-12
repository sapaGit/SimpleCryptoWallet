//
//  extension + UserDefaults.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 11.12.2022.
//

import Foundation
extension UserDefaults {
    var coins: Set<Coin> {
        get {
            guard let data = UserDefaults.standard.data(forKey: "coins") else { return Set<Coin>() }
            return (try? PropertyListDecoder().decode(Set<Coin>.self, from: data)) ?? Set<Coin>()
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "coins")
        }
    }
}
