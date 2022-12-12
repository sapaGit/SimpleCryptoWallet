//
//  DetailViewController.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class DetailViewController: UIViewController {

    var infoLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.textAlignment = .left
            label.numberOfLines = 0
            label.font = UIFont(name: "Helvetica-Bold", size: 22)
            label.text = " akl ska las skmalsk mask malm slams a;sm ;sam asm; ems;dl;dm"
            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.title = "Detail info"
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
