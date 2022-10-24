//
//  CreateEmployee.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 22/10/2022.
//

import UIKit

class CreateEmployee: UIViewController, nextPerssedInDepSelection {
    
    let createEmpView = CreateEmployeeView()
    let addEmployeeVC = AddEmployee()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createEmpView.tableView.delegate = self
        createEmpView.tableView.dataSource = self
        
    }
    
    override func loadView() {
        super.loadView()
        view = createEmpView
        
        title = "Create Employees"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEmployee))
    }
    
    @objc func addEmployee(_ sender: UIBarButtonItem){
        present(addEmployeeVC, animated: true)
    }
    
    func didPressNextOrSave(cell: DepartmentSelectionBtnCell) {
        print("foo - next pressed")
    }
}

//MARK: tableView Delegate and DataSource

extension CreateEmployee: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreatedEmployeeCell.reuseID, for: indexPath) as? CreatedEmployeeCell else {return UITableViewCell()}
        
        cell.nameLabel.text = "Abdallah Mahameed"
        cell.titleLabel.text = "iOS App Developer"
        cell.levelLabel.text = "Employee"
        cell.statusLabel.text = "Active"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID) as? DepartmentSelectionBtnCell else {return UITableViewCell()}

        btnCell.nextButton.setTitle("Save", for: [])
        btnCell.delegate = self

        return btnCell
    }
}

