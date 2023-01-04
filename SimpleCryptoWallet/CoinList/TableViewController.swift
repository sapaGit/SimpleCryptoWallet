//
//  TableViewController.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 10.12.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var indicator = UIActivityIndicatorView()
    
    private var viewModel: TableViewModelProtocol? {
        didSet {
            viewModel?.fetchCoins {
                self.tableView.reloadData()
                self.indicator.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        setupNavigationBar()
        activityIndicator()
        indicator.startAnimating()
        viewModel = TableViewModel()
    }
    
    private func goToDetailVC(sender: Any?) {
        let controller = DetailViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        controller.viewModel = sender as? DetailViewModelProtocol
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
    
    private func switchController() {
        let loginVC = LoginViewController()
        guard let window = self.view.window else { return }
        window.switchRootViewController(loginVC)
    }
    
    @objc private func logOutTapped(_ sender: Any){
        viewModel?.logOutTapped()
        switchController()
    }
    
    @objc private func sortTapped(_ sender: Any){
        viewModel?.sortTapped()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CoinTableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.viewModel = viewModel?.cellViewModel(at: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewModel = viewModel?.viewModelForSelectedRow(at: indexPath)
        goToDetailVC(sender: detailsViewModel)
    }
}

