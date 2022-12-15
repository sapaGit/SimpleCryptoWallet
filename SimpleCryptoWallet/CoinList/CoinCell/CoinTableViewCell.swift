//
//  CoinTableViewCell.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    let coinName = UILabel()
    let coinPrice = UILabel()
    let coinChange = UILabel()
    
    var viewModel: CoinCellViewModelProtocol! {
        didSet {
            coinName.text = viewModel.coinName
            coinPrice.text = viewModel.coinPrice
            coinChange.text = viewModel.coinChange
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setCell()
        addSubviews()
        setConstraints()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    private func setCell() {
        coinName.translatesAutoresizingMaskIntoConstraints = false
        coinName.font = UIFont.boldSystemFont(ofSize: 20)
        coinPrice.translatesAutoresizingMaskIntoConstraints = false
        coinPrice.font = UIFont.systemFont(ofSize: 15)
        coinChange.translatesAutoresizingMaskIntoConstraints = false
        coinChange.font = UIFont.systemFont(ofSize: 15)
    }
    
    private func addSubviews() {
        contentView.addSubview(coinName)
        contentView.addSubview(coinPrice)
        contentView.addSubview(coinChange)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            coinName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            coinPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            coinPrice.topAnchor.constraint(equalTo: coinName.bottomAnchor, constant: 10),
            
            coinChange.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            coinChange.topAnchor.constraint(equalTo: coinPrice.bottomAnchor, constant: 10),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
