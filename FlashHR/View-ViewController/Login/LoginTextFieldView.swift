//
//  LoginTextFieldView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//


import UIKit

class LoginTextFieldView: UIView {
    
    let usernameTextfield = UITextField()
    let passwordTextfield = UITextField()
    let userTypeLabel = UILabel()
    let passTypeLabel = UILabel()
    let divider = UIView()
    let divider1 = UIView()
    var textFieldType = ""
    var isEmailTextfield = false
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginTextFieldView {
    
    func style() {
        backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 12
        
        userTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        userTypeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        userTypeLabel.text = "Email"
        userTypeLabel.textColor = .label
        
        passTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        passTypeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        passTypeLabel.text = "Password"
        passTypeLabel.textColor = .label
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .separator
        
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.backgroundColor = .separator
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.borderStyle = .none
        usernameTextfield.keyboardType = .emailAddress
        usernameTextfield.placeholder = "name@domain.com"
        usernameTextfield.delegate = self
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.borderStyle = .none
        passwordTextfield.isSecureTextEntry = true
        passwordTextfield.enableSecureToggle()
        passwordTextfield.keyboardType = .namePhonePad
        passwordTextfield.placeholder = "A*123c"
        passwordTextfield.delegate = self
        
        
        
    }
    
    func layout() {
        
        
        stackView.addArrangedSubview(userTypeLabel)
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passTypeLabel)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.addArrangedSubview(divider1)
        addSubview(stackView)

        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

extension LoginTextFieldView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
}
