//
//  PasswordReset.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 07/10/2022.
//

import UIKit

class PasswordReset: UIViewController {
    
    let stackView = UIStackView()
    let textFieldStackView = UIStackView()
    
    let descriptionLabel = UILabel()
    let usernameTextfield = UITextField()
    let userTypeLabel = UILabel()
    let divider = UIView()
    let submitButton = UIButton(type: .system)
    let backButton = UIButton(type: .close)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    @objc func submitPressed(_ sender: UIButton){
        self.dismiss(animated: true)
    }
    
    @objc func backPressed(_ sender: UIButton){
        self.dismiss(animated: true)
    }
}

extension PasswordReset {
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 40
        
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.axis = .vertical
        textFieldStackView.distribution = .fill
        textFieldStackView.spacing = 8
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "To reset your Password, please type your registered email. Thereafter, you will recieve an email to reset your password."
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        userTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        userTypeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        userTypeLabel.text = "Email"
        userTypeLabel.textColor = .label
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .separator
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.borderStyle = .none
        usernameTextfield.keyboardType = .emailAddress
        usernameTextfield.placeholder = "name@domain.com"
        usernameTextfield.delegate = self
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.configuration = .filled()
        submitButton.tintColor = UIColor(named: "blue")
        submitButton.setTitle("Submit", for: [])
        submitButton.addTarget(self, action: #selector(submitPressed), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor(named: "blue")
        backButton.addTarget(self, action: #selector(backPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        textFieldStackView.addArrangedSubview(userTypeLabel)
        textFieldStackView.addArrangedSubview(usernameTextfield)
        textFieldStackView.addArrangedSubview(divider)
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(textFieldStackView)
        
        view.addSubview(backButton)
        view.addSubview(stackView)
        view.addSubview(submitButton)
        
//        backButton
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 4),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4)
        ])
//        stackView
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: submitButton.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: submitButton.trailingAnchor),
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
//       submitButton
        NSLayoutConstraint.activate([
        
            submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 109),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 4)
        ])
    }
}

extension PasswordReset: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
