//
//  NetworkManager.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    var cryptoValuesArray = CryptoValues.allCases.map { $0.rawValue }
    var coinsArray = [Coin]()
    
    func fetchData(url: String, completion: @escaping (_ coin: Coin) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else  {
                print(error?.localizedDescription ?? "No Description")
                return
            }
            do {
           
                let coin = try JSONDecoder().decode(Coin.self, from: data)
                DispatchQueue.main.async {
                    print(coin)
                    completion(coin)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
    
    func asyncGroup(completion: @escaping () -> Void) {
        let aGroup = DispatchGroup()
        for coinString in cryptoValuesArray {
            aGroup.enter()
            fetchData(url: "https://data.messari.io/api/v1/assets/\(coinString)/metrics") { coin in
                self.coinsArray.append(coin)
                aGroup.leave()
            }
        }
        aGroup.notify(queue: .main) {
            let sortedArray = self.coinsArray.sorted { $0.data.marketData.percentChangeUsdLast24Hours < $1.data.marketData.percentChangeUsdLast24Hours
            }
            self.coinsArray = sortedArray
            completion()
        }
    }
}
