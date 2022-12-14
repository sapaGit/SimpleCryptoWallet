//
//  LoginViewModel.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 14.12.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    
    func changeLogInStatus()
    func logInButtonPressed()
    func isLessThanFiveSymbols(logInText: String?, passwordText: String?) -> Bool
}

class LoginViewModel: LoginViewModelProtocol {
    
    
    func changeLogInStatus() {
        DataManager.shared.isLoggedIn = true
        UserDefaults.standard.set(DataManager.shared.isLoggedIn, forKey: "loggedIn")
    }
    func logInButtonPressed() {
        changeLogInStatus()
    }
    func isLessThanFiveSymbols(logInText: String?, passwordText: String?) -> Bool {
        return logInText?.count ?? 1 < 5 || passwordText?.count ?? 1 < 5
    }
}
