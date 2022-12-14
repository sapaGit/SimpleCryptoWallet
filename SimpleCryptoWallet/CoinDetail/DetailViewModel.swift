//
//  DetailViewModel.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 14.12.2022.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var detailInfo: String { get }
    init(coin: Coin)
}

class DetailViewModel: DetailViewModelProtocol {
    var detailInfo: String {
                """
                name: \(coin.data.name)
                symbol: \(coin.data.symbol)
                slug: \(coin.data.slug)
                price: \(round(coin.data.marketData.priceUsd*1000)/1000) USD
                change per day: \(round(coin.data.marketData.percentChangeUsdLast24Hours*100)/100) %
                """
    }
    
    private let coin: Coin
    
    required init(coin: Coin) {
        self.coin = coin
    }
    
    
}
