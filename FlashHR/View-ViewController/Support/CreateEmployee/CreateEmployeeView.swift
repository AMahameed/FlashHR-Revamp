//
//  CreateEmployeeView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 22/10/2022.
//

import UIKit

class CreateEmployeeView: UIView {
    
    let tableView = UITableView()
//    let tableBackgroundImg = UIImageView(image: UIImage(named: "addEmp"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CreateEmployeeView {
    
    func style() {
        backgroundColor = .systemBackground
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CreatedEmployeeCell.self, forCellReuseIdentifier: CreatedEmployeeCell.reuseID)
        tableView.register(DepartmentSelectionBtnCell.self, forCellReuseIdentifier: DepartmentSelectionBtnCell.reuseID)
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .systemGray5
//        tableView.backgroundView = tableBackgroundImg
        
//        tableBackgroundImg.translatesAutoresizingMaskIntoConstraints = false
    
    }
    
    func layout() {
        
        //        tableView.addSubview(tableBackgroundImg)
        addSubview(tableView)
        
        //        tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            //            tableBackgroundImg.heightAnchor.constraint(equalToConstant: 250),
            //            tableBackgroundImg.widthAnchor.constraint(equalToConstant: 361),
            //            tableBackgroundImg.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            //            tableBackgroundImg.centerYAnchor.constraint(equalTo: tableView.centerYAnchor)
        ])
    }
        
}
