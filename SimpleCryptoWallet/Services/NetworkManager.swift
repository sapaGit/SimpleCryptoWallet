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
    var urlArray = CryptoValues.allCases.map { "https://data.messari.io/api/v1/assets/\($0.rawValue)/metrics" }
    
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
                    completion(coin)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
    
    func asyncGroup(completion: @escaping (_ coins: [Coin]) -> Void) {
        let aGroup = DispatchGroup()
        var coinsArray = [Coin]()
        for url in urlArray {
            aGroup.enter()
            fetchData(url: url) { coin in
                coinsArray.append(coin)
                aGroup.leave()
            }
        }
        aGroup.notify(queue: .main) {
            completion(coinsArray)
        }
    }
}
