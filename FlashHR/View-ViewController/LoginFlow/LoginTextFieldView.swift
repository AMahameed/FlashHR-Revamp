//
//  LoginTextFieldView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//


import UIKit

class LoginTextFieldView: UIView {
    
    let textField = UITextField()
    let typeLabel = UILabel()
    let divider = UIView()
    var textFieldType = ""
    var isEmailTextfield = false
    let stackView = UIStackView()
    
    init(textFieldType: String = "", isEmailTextfield: Bool = false) {
        self.textFieldType = textFieldType
        self.isEmailTextfield = isEmailTextfield
        
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }
}

extension LoginTextFieldView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .body)
        typeLabel.text = textFieldType
        typeLabel.textColor = .label
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .separator
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        textField.placeholder = textFieldType
        textField.keyboardType = .emailAddress
        textField.text = "Mahameed"
        textField.placeholder = "name@domain.com"
        textField.delegate = self
        
        if !isEmailTextfield{
            textField.isSecureTextEntry = true
            textField.enableSecureToggle()
            textField.keyboardType = .namePhonePad
            textField.text = "mahameed"
            textField.placeholder = "A@123Bc"
        }
        
        
    }
    
    func layout() {
        
        
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(divider)
        addSubview(stackView)

        NSLayoutConstraint.activate([

            divider.heightAnchor.constraint(equalToConstant: 1),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
    }
}

extension LoginTextFieldView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
