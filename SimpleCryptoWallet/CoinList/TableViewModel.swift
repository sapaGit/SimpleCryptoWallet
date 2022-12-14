//
//  TableViewModel.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 14.12.2022.
//

import Foundation

protocol TableViewModelProtocol: AnyObject {
    var coins: [Coin] { get set }
    func fetchCoins(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func logOutTapped()
    func sortTapped()
    func cellViewModel(at indexPath: IndexPath) -> CoinCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class TableViewModel: TableViewModelProtocol {
    
    var coins: [Coin] = []
    
    func cellViewModel(at indexPath: IndexPath) -> CoinCellViewModelProtocol {
        let coin = coins[indexPath.row]
        return CoinCellViewModel(coin: coin)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol {
        let coin = coins[indexPath.row]
        return DetailViewModel(coin: coin)
    }
    func sortTapped() {
        coins = coins.reversed()
    }
    
    func logOutTapped() {
        coins = []
        DataManager.shared.isLoggedIn = false
        UserDefaults.standard.set(DataManager.shared.isLoggedIn, forKey: "loggedIn")
    }
    
    func fetchCoins(completion: @escaping () -> Void) {
        NetworkManager.shared.asyncGroup { [unowned self] coins in
            self.coins = coins.sorted { $0.data.marketData.percentChangeUsdLast24Hours < $1.data.marketData.percentChangeUsdLast24Hours
            }
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        coins.count
    }
}
