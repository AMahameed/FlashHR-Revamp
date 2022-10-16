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
    
    func didPressloginBtn(button: UIButton) {
        let vc = OnboardingVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func didPressPassResetBtn(button: UIButton) {
        self.present(loginView.passReset, animated: true)
    }
}
