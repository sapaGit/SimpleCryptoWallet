//
//  TableViewController.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var indicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.rowHeight = 90
        setupNavigationBar()
        activityIndicator()
        indicator.startAnimating()
        NetworkManager.shared.asyncGroup(completion: {
            self.indicator.stopAnimating()
            self.tableView.reloadData()
        })
    }

    private func goToDetailVC(sender: Any?) {
        let controller = DetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        controller.coin = sender as? Coin
    }
    
    private func setupNavigationBar() {
        if #available(iOS 13, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            let logOutButtonItem = UIBarButtonItem(title: "Log out",
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(logOutTapped))
            let sortButtonItem = UIBarButtonItem(title: "Sort by change",
                                                      style: .plain,
                                                      target: self,
                                                      action: #selector(sortTapped))
            self.navigationItem.leftBarButtonItem  = sortButtonItem
            self.navigationItem.rightBarButtonItem  = logOutButtonItem
            }
        }
    
    private func activityIndicator() {
        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
                indicator.style = UIActivityIndicatorView.Style.large
                indicator.color = .systemBlue
                self.view.addSubview(indicator)
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
        NetworkManager.shared.coinsArray = NetworkManager.shared.coinsArray.reversed()
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
