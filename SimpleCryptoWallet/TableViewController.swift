//
//  TableViewController.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class TableViewController: UITableViewController {
    private var coins: [Coin] = Array(UserDefaults.standard.coins)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        setupNavigationBar()
        NetworkManager.shared.asyncGroup(tableView: tableView)
    }

    private func goToDetailVC(sender: Any?) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            let logOutButtonItem = UIBarButtonItem(title: "Log out",
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(logOutTapped))
            let sortButtonItem = UIBarButtonItem(title: "🔃",
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(sortTapped))
            self.navigationItem.leftBarButtonItem  = sortButtonItem
            self.navigationItem.rightBarButtonItem  = logOutButtonItem
            }
        }
    @objc func logOutTapped(_ sender: Any){
        let loginVC = LoginViewController()
        guard let window = self.view.window else {
            return
        }
        NetworkManager.shared.coinsArray = []
        window.switchRootViewController(loginVC)
        DataManager.shared.isLoggedIn = false
        UserDefaults.standard.set(DataManager.shared.isLoggedIn, forKey: "loggedIn")
    }
    
    @objc func sortTapped(_ sender: Any){
        let sortedArray = NetworkManager.shared.coinsArray.sorted { $0.data.name < $1.data.name
        }
        NetworkManager.shared.coinsArray = sortedArray
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.shared.coinsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CoinTableViewCell()
        let coin = NetworkManager.shared.coinsArray[indexPath.row]
        cell.configure(with: coin)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let coin = NetworkManager.shared.coinsArray[indexPath.row]
        goToDetailVC(sender: coin)
    }
}
