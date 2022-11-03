//
//  AddEmployee.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//

protocol didAddNewEmp: AnyObject {
    func didAddEmployee(_ emp: Employee)
}

import UIKit

class AddEmployee: UIViewController, didPressCloseButton, nextPerssedInDepSelection{

    let addEmpView = AddEmployeeView()
    var addEmployee = Employee()
    var fields = ["Name", "Email","Password", "Department", "Level", "Title", "Mobile"]
    weak var delegate: didAddNewEmp?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addEmpView.tableView.delegate = self
        addEmpView.tableView.dataSource = self
        addEmpView.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = addEmpView
        view.backgroundColor = .systemBackground
    }
    
    func didPressClose(close: UIButton) {
        dismiss(animated: true)
    }
    
    func didPressNextOrSave(_ button: UIButton) {
        delegate?.didAddEmployee(addEmployee)
        dismiss(animated: true)
    }
}

//MARK: tableView Delegate and DataSource

extension AddEmployee: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddEmployeeCell.reuseID, for: indexPath) as? AddEmployeeCell else {return UITableViewCell()}
        
        guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID, for: indexPath) as? DepartmentSelectionBtnCell else {return UITableViewCell()}
        
        cell.textField.tag = indexPath.row
        cell.textField.delegate = self
        btnCell.delegate = self
        
        switch indexPath.row {
        case 3:
            cell.configureCell(field: fields[indexPath.row], info: getInfoFromModel(at: indexPath.row), at: indexPath.row, depHandler:  { [weak self] dep, UID  in
                guard let self = self else {return}
                self.addEmployee.depName = dep
                self.addEmployee.depUID = String(UID)})
        case 4:
            cell.configureCell(field: fields[indexPath.row], info: getInfoFromModel(at: indexPath.row), at: indexPath.row, levelHandler:  { [weak self] level in
                guard let self = self else {return}
                self.addEmployee.levelStr = level
                self.addEmployee.level = self.getLevel(level)})
        case 7:
            btnCell.configureBtnCell(at: indexPath.row)
            return btnCell
        default:
            cell.configureCell(field: fields[indexPath.row], info: getInfoFromModel(at: indexPath.row), at: indexPath.row)
        }
        
        return cell
    }
}

//MARK: TextField Delegate
extension AddEmployee: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField.tag {
        case 0:
            addEmployee.name = textField.text ?? ""
        case 1:
            addEmployee.email = textField.text ?? ""
        case 2:
            addEmployee.password = textField.text ?? ""
        case 5:
            addEmployee.title = textField.text ?? ""
        case 6:
            addEmployee.mobile = textField.text ?? ""
        default:
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
    }
    
    private func getInfoFromModel(at row: Int) -> String?{
        switch row{
        case 0:
            return addEmployee.name
        case 1:
            return addEmployee.email
        case 2:
            return addEmployee.password
        case 5:
            return addEmployee.title
        case 6:
            return addEmployee.mobile
        default:
            return ""
        }
    }
    
    private func getLevel(_ text: String?) -> Level{
        
        switch text{
        case "HR Manager":
            return Level(isHRManager: true)
        case "HR Agent":
            return Level(isHRAgent: true)
        case "Manager":
            return Level(isManager: true)
        case "Supervisor":
            return Level(isSupervisor: true)
        case "Regular":
            return Level(isEmployee: true)
        default:
            return Level()
        }
    }
}
