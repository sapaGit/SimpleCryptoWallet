//
//  DetailViewController.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var coin: Coin!
    
    var infoLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont(name: "Helvetica-Bold", size: 22)
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Detail info"
        infoLabel.text = """
        name: \(coin.data.name)
        symbol: \(coin.data.symbol)
        slug: \(coin.data.slug)
        price: \(round(coin.data.marketData.priceUsd*1000)/1000) USD
        change per day: \(round(coin.data.marketData.percentChangeUsdLast24Hours*100)/100) %
        """
        view.addSubview(infoLabel)
        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            infoLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }

}
