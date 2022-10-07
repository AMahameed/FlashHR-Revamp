//
//  PasswordReset.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 07/10/2022.
//

import UIKit

protocol didFinishPasswordReset: AnyObject {
    func backOrSubmitPressed()
}

class PasswordReset: UIViewController {
    
    let stackView = UIStackView()
    
    let descriptionLabel = UILabel()
    let emailTextfield = LoginTextFieldView(textFieldType: "Email", isEmailTextfield: true)
    let submitButton = UIButton(type: .system)
    let backButton = UIButton(type: .close)
    
    weak var delegate: didFinishPasswordReset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    @objc func submitPressed(_ sender: UIButton){
        delegate?.backOrSubmitPressed()
    }
    
    @objc func backPressed(_ sender: UIButton){
        delegate?.backOrSubmitPressed()
    }
}

extension PasswordReset {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 40
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "To reset your Password, please type your registered email. Thereafter, you will recieve an email to reset your password."
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.configuration = .filled()
        submitButton.tintColor = UIColor(named: "blue")
        submitButton.setTitle("Submit", for: [])
        submitButton.addTarget(self, action: #selector(submitPressed), for: .primaryActionTriggered)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
//        backButton.configuration = .filled()
        backButton.tintColor = UIColor(named: "blue")
//        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(backPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(emailTextfield)
        
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
        
//       submitButton
        NSLayoutConstraint.activate([
        
            submitButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 109),
            submitButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: submitButton.trailingAnchor, multiplier: 4)
        ])
    }
}
