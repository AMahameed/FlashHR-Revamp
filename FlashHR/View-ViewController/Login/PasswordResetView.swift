//
//  PasswordResetView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 16/10/2022.
//

protocol PassResetButtonsPressed: AnyObject {
    func didPressSubmitBtn(button: UIButton)
    func didPressBackBtn(button: UIButton)
}

import UIKit

class PasswordResetView: UIView {
    
    let stackView = UIStackView()
    let textFieldStackView = UIStackView()
    
    let descriptionLabel = UILabel()
    let usernameTextfield = UITextField()
    let userTypeLabel = UILabel()
    let divider = UIView()
    let submitButton = UIButton(type: .custom)
    let backButton = UIButton(type: .close)
    
    weak var delegate: PassResetButtonsPressed?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func submitPressed(_ sender: UIButton){
        delegate?.didPressSubmitBtn(button: sender)
    }
    
    @objc func backPressed(_ sender: UIButton){
        delegate?.didPressBackBtn(button: sender)
    }
}

//MARK: style and layout
extension PasswordResetView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
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
        submitButton.setTitle("Submit", for: [])
        submitButton.tintColor = UIColor(named: "blue")
        submitButton.addTarget(self, action: #selector(submitPressed), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        textFieldStackView.addArrangedSubview(userTypeLabel)
        textFieldStackView.addArrangedSubview(usernameTextfield)
        textFieldStackView.addArrangedSubview(divider)
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(textFieldStackView)
        
       addSubview(backButton)
       addSubview(stackView)
       addSubview(submitButton)
        
//        backButton
        NSLayoutConstraint.activate([
        
            backButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 4),
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4)
        ])
//        stackView
        NSLayoutConstraint.activate([
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: submitButton.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: submitButton.trailingAnchor),
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
//       submitButton
        NSLayoutConstraint.activate([
        
            submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 109),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 4)
        ])
    }
}

extension PasswordResetView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextfield.endEditing(true)
    }
}
