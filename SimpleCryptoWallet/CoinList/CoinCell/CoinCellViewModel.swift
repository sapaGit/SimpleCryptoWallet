//
//  CoinCellViewModel.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 14.12.2022.
//

import Foundation

protocol CoinCellViewModelProtocol: AnyObject {
    var coinName: String { get }
    var coinPrice: String { get }
    var coinChange: String { get }
    init(coin: Coin)
}

class CoinCellViewModel: CoinCellViewModelProtocol {
    var coinName: String {
        coin.data.name
    }
    
    var coinPrice: String {
        "Current price: \(round(coin.data.marketData.priceUsd*1000)/1000) $"
    }
    
    var coinChange: String {
        "Change per 24 hours: \(round(coin.data.marketData.percentChangeUsdLast24Hours*100)/100) %"
    }
    
    private let coin: Coin
    
    required init(coin: Coin) {
        self.coin = coin
    }
    
    
}
