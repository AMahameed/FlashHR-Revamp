//
//  AddEmployeeCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//

import UIKit

class AddEmployeeCell: UITableViewCell{
    
    let view = UIView()
    let typeLabel = UILabel()
    let divider = UIView()
    let textField = UITextField()
    let saveButton = UIButton(type: .custom)
    
    static let reuseID = "AddEmployeeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        textField.isSecureTextEntry = false
    }
    
    func configureCell(field type: String, info: String?, at row: Int){
        
        typeLabel.text = type
        textField.text = info ?? ""
        
        switch row {
        case 1:
            textField.keyboardType = .emailAddress
        case 2:
            textField.isSecureTextEntry = true
        default:
            break
        }
    }
}

//MARK: Cell style and layout

extension AddEmployeeCell: UITextFieldDelegate{
    func setup(){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .body)

        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "blue")
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray5
        textField.clearsOnBeginEditing = true
        textField.delegate = self
    }
    
    func layout(){
        
        view.addSubview(typeLabel)
        view.addSubview(divider)
        view.addSubview(textField)
        
        contentView.addSubview(view)
        
//       view
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
//        depLabel
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.5),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3.5)
        ])
        
//        divider
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.widthAnchor.constraint(equalToConstant: 75),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 0.5),
            divider.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
        ])
        
//        depTextfield
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            textField.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 3.5)
        ])
    }
}
