//
//  DepartmentSelection.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 19/10/2022.
//

import UIKit

class DepartmentSelection: UIViewController, nextPerssedInDepSelection{
    
    let createEmp = CreateEmployee()
    let departmentSelectionView = DepartmentSelectionView()
    var departments: [Department] = []//Department(depName: "Human Resources", depUID: "0"),
                       //Department(depName: "Information Technology ", depUID: "1"),
                       //Department(depName: "Customer Service", depUID: "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departmentSelectionView.tableView.delegate = self
        departmentSelectionView.tableView.dataSource = self
    }
    
    override func loadView() {
        super.loadView()
        
        view = departmentSelectionView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDepPressed))
        view.backgroundColor = .systemBackground
        title = "Departments Selection"
    }
    
    @objc func addDepPressed(_ sender: UIBarButtonItem){
        departments.append(Department(depName: "", depUID: ""))
        departmentSelectionView.tableView.reloadData()
    }
    
    func didPressNextOrSave(_ button: UIButton) {
        createEmp.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(createEmp, animated: true)
    }
}

//MARK: TableView Delegate and DataSource
extension DepartmentSelection: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionCell.reuseID, for: indexPath) as? DepartmentSelectionCell else {return UITableViewCell()}
        
        cell.depLabel.text = "Department No. " + indexPath.row.description
        cell.depTextfield.text = departments[indexPath.row].depName
        cell.IDTextfield.text = indexPath.row.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID) as? DepartmentSelectionBtnCell else {return UITableViewCell()}
        
        btnCell.delegate = self
        
        return btnCell
    }
}

