//
//  ViewController.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//

import UIKit

class LoginVC: UIViewController{

    let loginView = LoginView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        loginView.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
}

extension LoginVC {
    func style() {
        view.backgroundColor = .systemBackground
    }
    
    func layout() {
    }
}

extension LoginVC: ButtonsPressed{
    
    func didPressloginBtn(button: UIButton) {
        let vc = OnboardingVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func didPressPassResetBtn(button: UIButton) {
        self.present(loginView.passReset, animated: true)
    }
}
