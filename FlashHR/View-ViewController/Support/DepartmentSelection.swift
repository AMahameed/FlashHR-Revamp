//
//  DepartmentSelection.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 19/10/2022.
//

import UIKit

class DepartmentSelection: UIViewController{
    
    let departmentSelectionView = DepartmentSelectionView()
    
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
        departmentSelectionView.departments.append(Department(depName: "Test Cell", depUID: ""))
        departmentSelectionView.tableView.reloadData()
    }
}

//MARK: TableView Delegate and DataSource
extension DepartmentSelection: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        departmentSelectionView.departments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionCell.reuseID, for: indexPath) as? DepartmentSelectionCell else {return UITableViewCell()}
        
        cell.depLabel.text = "Department No. " + indexPath.row.description
        cell.depTextfield.text = departmentSelectionView.departments[indexPath.row].depName
        cell.IDTextfield.text = indexPath.row.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID) as? DepartmentSelectionBtnCell else {return UITableViewCell()}
        
        return btnCell
    }
}

