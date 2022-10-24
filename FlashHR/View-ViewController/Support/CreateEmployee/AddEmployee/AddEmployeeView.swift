//
//  AddEmployeeView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//

protocol didPressCloseButton: AnyObject {
    func didPressClose(close: UIButton)
}

import UIKit

class AddEmployeeView: UIView {
    
    let closeButton = UIButton(type: .close)
    let image = UIImageView()
    let tableView = UITableView()
    
    weak var delegate: didPressCloseButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closePressed(_ sender: UIButton){
        delegate?.didPressClose(close: sender)
    }
}

extension AddEmployeeView {
    
    func style() {
        backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AddEmployeeCell.self, forCellReuseIdentifier: AddEmployeeCell.reuseID)
        tableView.register(DepartmentSelectionBtnCell.self, forCellReuseIdentifier: DepartmentSelectionBtnCell.reuseID)
        tableView.rowHeight = 90
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closePressed), for: .primaryActionTriggered)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "userPhoto")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
//        image.target(forAction: #selector(imagePressed), withSender: .none) to upload the image
    }
    
    func layout() {

        addSubview(closeButton)
        addSubview(image)
        addSubview(tableView)
        
//        backButton
        NSLayoutConstraint.activate([
            
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 4),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4)
        ])
        
//        image
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 130),
            image.widthAnchor.constraint(equalToConstant: 130),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.topAnchor.constraint(equalToSystemSpacingBelow: closeButton.bottomAnchor, multiplier: 2)
        ])
        
//        tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: image.bottomAnchor, multiplier: 2),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
