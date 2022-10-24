//
//  AddEmployee.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//


import UIKit

class AddEmployee: UIViewController, nextPerssedInDepSelection, didPressCloseButton {
    
    let addEmpView = AddEmployeeView()
    var fields = ["Name", "Email","Password", "Department", "Level", "Title", "Mobile"]
    var addEmployee = Employee()
    
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
    
    func didPressNextOrSave(cell: DepartmentSelectionBtnCell) {
        
        switch cell.nextButton.tag {
        case 1:
            print("foo - 1")
        case 2:
            print("foo - 2")
        case 3:
            dismiss(animated: true)
        default:
            print("faild")
        }
    }
    
    func didPressClose(close: UIButton) {
        dismiss(animated: true)
    }
    
//    private func getInfoBy(_ index: Int) -> String?{
//        switch index{
//        case 0:
//            return addEmployee.name
//        case 1:
//            return addEmployee.email
//        case 2:
//            return addEmployee.password
//        case 3:
//            return addEmployee.department
////        case 4:
////            return addEmployee.level
//        case 5:
//            return addEmployee.title
//        case 6:
//            return addEmployee.title
//        default:
//            return ""
//        }
//    }
}

//MARK: tableView Delegate and DataSource

extension AddEmployee: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields.count + 1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AddEmployeeCell.reuseID, for: indexPath) as? AddEmployeeCell else {return UITableViewCell()}
        
        guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID, for: indexPath) as? DepartmentSelectionBtnCell else {return UITableViewCell()}
        
        btnCell.delegate = self

        switch indexPath.row{
        case 0 :
            cell.typeLabel.text = "Name"

        case 1 :
            cell.typeLabel.text = "Email"

        case 2 :
            cell.typeLabel.text = "Password"
            cell.textField.isSecureTextEntry = true

        case 3 :
            btnCell.nextButton.setTitle("select Department", for: [])
            btnCell.nextButton.tag = 1
            return btnCell

        case 4 :
            btnCell.nextButton.setTitle("select Level", for: [])
            btnCell.nextButton.tag = 2
            return btnCell

        case 5 :
            cell.typeLabel.text = "Title"

        case 6 :
            cell.typeLabel.text = "Mobile"

        case 7 :
            btnCell.nextButton.setTitle("Save", for: [])
            btnCell.nextButton.tag = 3
            return btnCell

        default:
            break
        }
        return cell
    }
}

