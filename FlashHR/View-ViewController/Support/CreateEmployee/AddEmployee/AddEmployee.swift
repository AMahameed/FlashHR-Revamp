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
    let choosingDepVC = ChoosingDepartment()
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

        switch button.tag {
        case 1:
            presentPopup()
        case 2:
            print("foo - Level")
        case 3:
            delegate?.didAddEmployee(addEmployee)
            dismiss(animated: true)
        default:
            print("faild")
        }
    }
    
    func presentPopup() {
        choosingDepVC.modalPresentationStyle = .overCurrentContext
        choosingDepVC.modalTransitionStyle = .crossDissolve
        present(choosingDepVC, animated: true, completion: nil)
        view.alpha = 0.3
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
        
        if 3 ..< 5 ~= indexPath.row || indexPath.row == 7{
            btnCell.configureBtnCell(at: indexPath.row)
            return btnCell
        }else{
            cell.configureCell(field: fields[indexPath.row], info: getInfoFromModel(at: indexPath.row), at: indexPath.row)
            return cell
        }
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
}
