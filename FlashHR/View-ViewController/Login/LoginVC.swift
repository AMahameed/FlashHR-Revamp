//
//  LoginVC.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//

import UIKit

class LoginVC: UIViewController{

    let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
}

//MARK: Login and Reset Password buttons Delegates

extension LoginVC: LoginButtonsPressed{
    func didPressloginBtnToOnboading(button: UIButton) {
        present(loginView.onboardingvVC, animated: true)
    }
    
    func didPressloginBtnToCompanySelection(button: UIButton) {
        present(loginView.comSelNC, animated: true)
    }
    
    func didPressPassResetBtn(button: UIButton) {
        present(loginView.passReset, animated: true)
    }
}
