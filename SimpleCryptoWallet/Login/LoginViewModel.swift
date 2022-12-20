//
//  LoginViewModel.swift
//  SimpleCryptoWallet
//
//  Created by Sergey Pavlov on 14.12.2022.
//

import Foundation

protocol LoginViewModelProtocol: AnyObject {
    
    func changeLogInStatus()
    func isLessThanFourSymbols(logInText: String?, passwordText: String?) -> Bool
}

class LoginViewModel: LoginViewModelProtocol {
    
    func changeLogInStatus() {
        DataManager.shared.setLoggedIn(key: "loggedIn", with: true)
    }
   
    func isLessThanFourSymbols(logInText: String?, passwordText: String?) -> Bool {
        return logInText?.count ?? 1 < 4 || passwordText?.count ?? 1 < 4
    }
}
