//
//  Coin.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import Foundation


// MARK: - Coin
struct Coin: Codable {

    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String
    let serialID: Int
    let symbol, name, slug: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
    }
}

