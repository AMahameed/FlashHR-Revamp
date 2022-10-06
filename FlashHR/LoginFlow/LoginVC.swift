//
//  ViewController.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    let stackView = UIStackView()
    let emailTextField = LoginTextField(textFieldType: "Email")
    let passwordTextField = LoginTextField(textFieldType: "Password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LoginVC {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func layout() {
    
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
            
        ])
    }
}

