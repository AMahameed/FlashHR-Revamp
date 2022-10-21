//
//  DepartmentSelectionView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 19/10/2022.
//

import UIKit

class DepartmentSelectionView: UIView {
    
    let tableView = UITableView()
    var departments = [Department(depName: "Human Resources", depUID: "0"),
                       Department(depName: "Information Technology ", depUID: "1"),
                       Department(depName: "Customer Service", depUID: "2")]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: style and layout
extension DepartmentSelectionView {
    
    func style() {
        backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DepartmentSelectionCell.self, forCellReuseIdentifier: DepartmentSelectionCell.reuseID)
        tableView.register(DepartmentSelectionBtnCell.self, forCellReuseIdentifier: DepartmentSelectionBtnCell.reuseID)
        tableView.rowHeight = DepartmentSelectionCell.rowHeight
        tableView.separatorColor = .systemGray
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .systemGray5
    }
    
    func layout() {
        
        addSubview(tableView)
        
        //        tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
