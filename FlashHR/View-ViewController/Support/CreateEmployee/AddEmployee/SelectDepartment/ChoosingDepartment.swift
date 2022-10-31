//
//  ChoosingDepartment.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 29/10/2022.
//

import UIKit

class ChoosingDepartment: UIViewController{
    
    let closeButton = UIButton(type: .close)
    let tableView = UITableView()
    let popupBox = UIView()
    
    var departments: [Department] = []
    
    override func viewDidLoad() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.didGetDepsNotification(_:)), name: Notification.Name("departmentsArray"), object: nil)
        style()
        layout()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func closedPressed(_ sender: UIButton){
        dismiss(animated: true)
        presentingViewController?.view.alpha = 1
    }

//    @objc func didGetDepsNotification(_ notification: Notification) {
//        let deps = notification.object as! [Department]
//
//        for dep in deps {
//            self.departments.append(dep)
//        }
//    }
    
    func addedDepartments(){
//        let depsSelection = DepartmentSelection()
//        depsSelection.depsHandler = { departments in
//            self.departments = departments
//        }
    }
}

extension ChoosingDepartment {
    
    func style() {
        
        view.backgroundColor = .clear
        presentingViewController?.view.alpha = 0.3
        
        popupBox.translatesAutoresizingMaskIntoConstraints = false
        popupBox.backgroundColor = .systemGray5
        popupBox.layer.cornerRadius = 10
        popupBox.clipsToBounds = true
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closedPressed), for: .primaryActionTriggered)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ChoosingDepartmentCell.self, forCellReuseIdentifier: ChoosingDepartmentCell.reuseID)
        tableView.rowHeight = 70
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
    }
    
    func layout() {
        
        popupBox.addSubview(closeButton)
        popupBox.addSubview(tableView)
        view.addSubview(popupBox)
        
        //        popupBox
        NSLayoutConstraint.activate([
            popupBox.heightAnchor.constraint(equalToConstant: 300),
            popupBox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            popupBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupBox.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //        close
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: popupBox.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: popupBox.leadingAnchor, multiplier: 2)
        ])
        
        //        tableView
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: closeButton.bottomAnchor, multiplier: 2),
            tableView.leadingAnchor.constraint(equalTo: closeButton.leadingAnchor),
            popupBox.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 2),
            popupBox.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 2)
        ])
    }
}

extension ChoosingDepartment: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChoosingDepartmentCell.reuseID, for: indexPath) as? ChoosingDepartmentCell else {return UITableViewCell()}
        
        cell.configureCell(at: indexPath.row, with: departments[indexPath.row].depName)
        
        return cell
    }
}
