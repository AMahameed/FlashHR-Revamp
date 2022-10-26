//
//  CreateEmployee.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 22/10/2022.
//

import UIKit

class CreateEmployee: UIViewController, nextPerssedInDepSelection, didAddNewEmp{

    let createEmpView = CreateEmployeeView()
    
    var addedEmp: [Employee] = []{
        didSet{
            createEmpView.tableView.reloadData()
        }
    }
    
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
        let addEmployeeVC = AddEmployee()
        addEmployeeVC.delegate = self
        present(addEmployeeVC, animated: true)
        
    }
    
    func didPressNextOrSave(_ button: UIButton) {
        print("foo - next pressed")
    }
    
    func didAddEmployee(_ emp: Employee) {
        addedEmp.append(emp)
        
    }
}

//MARK: tableView Delegate and DataSource

extension CreateEmployee: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addedEmp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreatedEmployeeCell.reuseID, for: indexPath) as? CreatedEmployeeCell else {return UITableViewCell()}
        
        cell.configure(name: addedEmp[indexPath.row].name, title: addedEmp[indexPath.row].title)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        if  addedEmp.count != 0{
            guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID) as? DepartmentSelectionBtnCell else {return UITableViewCell()}
            
            btnCell.nextButton.setTitle("Save", for: [])
            btnCell.delegate = self
            
            return btnCell
        }else{
            return UIView()
        }
    }
}

