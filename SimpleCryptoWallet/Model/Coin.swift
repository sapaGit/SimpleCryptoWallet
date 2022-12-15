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
    let symbol: String
    let name: String
    let slug: String
    let marketData: MarketData
    
    enum CodingKeys: String, CodingKey {
        case id
        case serialID = "serial_id"
        case symbol, name, slug
        case marketData = "market_data"
    }
}
struct MarketData: Codable {
    let priceUsd: Double
    let volumeLast24Hours: Double
    let realVolumeLast24Hours: Double
    let volumeLast24HoursOverstatementMultiple: Double
    let percentChangeUsdLast24Hours: Double
 
    
    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case volumeLast24Hours = "volume_last_24_hours"
        case realVolumeLast24Hours = "real_volume_last_24_hours"
        case volumeLast24HoursOverstatementMultiple = "volume_last_24_hours_overstatement_multiple"
        case percentChangeUsdLast24Hours = "percent_change_usd_last_24_hours"
    }
}

