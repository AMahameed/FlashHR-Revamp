//
//  DepartmentSelectionCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 20/10/2022.
//

import UIKit

class DepartmentSelectionCell: UITableViewCell, UITextFieldDelegate {
    
    let depLabel = UILabel()
    let divider = UIView()
    let depTextfield = UITextField()
    let IDTextfield = UITextField()
    let stackView = UIView()
    
    static let reuseID = "DepartmentSelectionCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        depTextfield.text = textField.text ?? ""
    }
    
    func configureCell(at row: Int) {
        depLabel.text = "Department No. " + String(row)
        IDTextfield.text = String(row)
    }
}

//MARK: style and layout
extension DepartmentSelectionCell{
    func setup() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.backgroundColor = UIColor.systemBackground
        stackView.layer.cornerRadius = 10
        stackView.clipsToBounds = true
        
        depLabel.translatesAutoresizingMaskIntoConstraints = false
        depLabel.font = UIFont.preferredFont(forTextStyle: .footnote)

        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "blue")
        
        depTextfield.translatesAutoresizingMaskIntoConstraints = false
        depTextfield.borderStyle = .roundedRect
        depTextfield.placeholder = "Department Name"
        depTextfield.backgroundColor = .systemGray5
        depTextfield.delegate = self
        
        IDTextfield.translatesAutoresizingMaskIntoConstraints = false
        IDTextfield.borderStyle = .roundedRect
        IDTextfield.isUserInteractionEnabled = false
        IDTextfield.backgroundColor = .systemGray5
        
    }
    
    func layout() {
        
        stackView.addSubview(depLabel)
        stackView.addSubview(divider)
        stackView.addSubview(depTextfield)
        stackView.addSubview(IDTextfield)
        
        contentView.addSubview(stackView)
        
//       view
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.5),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1.5),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1.5)
        ])
//        depLabel
        NSLayoutConstraint.activate([
            depLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.topAnchor, multiplier: 1),
            depLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 2)
        ])

//        divider
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.widthAnchor.constraint(equalToConstant: 60),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: depLabel.bottomAnchor, multiplier: 1),
            divider.leadingAnchor.constraint(equalTo: depLabel.leadingAnchor),
        ])

//        depTextfield
        NSLayoutConstraint.activate([
            depTextfield.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 2),
            depTextfield.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: depTextfield.trailingAnchor, multiplier: 4)
        ])

//        IDTextfield
        NSLayoutConstraint.activate([
            IDTextfield.topAnchor.constraint(equalToSystemSpacingBelow: depTextfield.bottomAnchor, multiplier: 2),
            IDTextfield.leadingAnchor.constraint(equalTo: depTextfield.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: IDTextfield.trailingAnchor, multiplier: 4)
        ])
    }
}

