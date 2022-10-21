//
//  CompanySelectionView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 18/10/2022.
//

protocol nextPerssedInComSelection: AnyObject{
    func didPressNext()
}

import UIKit

class CompanySelectionView: UIView {
    
    let stackView = UIStackView()
    
    let descriptionLabel = UILabel()
    let comNameTextfield = UITextField()
    let comUIDTextfield = UITextField()
    
    let nextButton = UIButton(type: .custom)
    let depVC = DepartmentSelection()
    
    weak var delegate: nextPerssedInComSelection?
    
    private let helperServices = HelperServices()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextPressed(_ sender: UIButton){
        depVC.modalPresentationStyle = .fullScreen
        delegate?.didPressNext()
        
    }
}

//MARK: style and layout
extension CompanySelectionView {
    
    func style() {
        backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 40
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        descriptionLabel.text = "𝘾𝙤𝙢𝙥𝙖𝙣𝙮 𝙉𝙖𝙢𝙚, should be written as per the govermental registrations. 𝘾𝙤𝙢𝙥𝙖𝙣𝙮 𝙐𝙄𝘿, will be filled automatically."
        descriptionLabel.textColor = .label
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        
        comNameTextfield.translatesAutoresizingMaskIntoConstraints = false
        comNameTextfield.borderStyle = .roundedRect
        comNameTextfield.backgroundColor = .systemGray5
        comNameTextfield.placeholder = "Company Name   e.g. Apple Inc."
        comNameTextfield.delegate = self
        
        comUIDTextfield.translatesAutoresizingMaskIntoConstraints = false
        comUIDTextfield.borderStyle = .roundedRect
        comUIDTextfield.backgroundColor = .systemGray5
        comUIDTextfield.placeholder = "Company UID   e.g. 23"
        comUIDTextfield.delegate = self
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration = .filled()
        nextButton.tintColor = UIColor(named: "blue")
        nextButton.setTitle("Next ", for: [])
        nextButton.addTarget(self, action: #selector(nextPressed), for: .primaryActionTriggered)
        // nextButton.configuration?.imagePadding = 8
         
    }
    
    func layout() {
        
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(comNameTextfield)
        stackView.addArrangedSubview(comUIDTextfield)
        stackView.addArrangedSubview(nextButton)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([

            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 6),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 6),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

extension CompanySelectionView: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       textField.endEditing(true)
    }
}
