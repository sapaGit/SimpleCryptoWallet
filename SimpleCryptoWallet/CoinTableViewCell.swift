//
//  CoinTableViewCell.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class CoinTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(with coin: Coin) {
        var content = defaultContentConfiguration()
        content.text = coin.data.name
        contentConfiguration = content
    }
}
