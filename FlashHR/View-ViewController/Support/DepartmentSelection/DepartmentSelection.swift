//
//  DepartmentSelection.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 19/10/2022.
//

import UIKit

class DepartmentSelection: UIViewController, nextPerssedInDepSelection{
    
    let departmentSelectionView = DepartmentSelectionView()

    var realDeps: [Department] = [Department(depName: "", depUID: "") ]{
        didSet{
            departmentSelectionView.tableView.reloadData()
        }
    }
    var department = Department()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departmentSelectionView.tableView.delegate = self
        departmentSelectionView.tableView.dataSource = self
    }
    
    override func loadView() {
        super.loadView()
        
        view = departmentSelectionView
        
        view.backgroundColor = .systemBackground
        title = "Departments"
    }
    
    func didPressNextOrSave(_ button: UIButton) {
        navigationController?.pushViewController(CreateEmployee(), animated: true)
    }
    
    func depAdditionChecks(for text: String?){
        guard !department.depName.replacingOccurrences(of: " ", with: "").isEmpty else {return}
        
        for dep in realDeps {
            guard let text = text, !dep.depName.elementsEqual(text) else {return}}// present alert message
        
        realDeps.append(department)
    }
}

//MARK: TableView Delegate and DataSource
extension DepartmentSelection: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realDeps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionCell.reuseID, for: indexPath) as? DepartmentSelectionCell else {return UITableViewCell()}
        
        cell.depTextfield.delegate = self
        cell.configureCell(at: indexPath.row)
        cell.depTextfield.text = realDeps[indexPath.row].depName
        department.depUID = indexPath.row.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        if realDeps.count > 1{
            guard let btnCell = tableView.dequeueReusableCell(withIdentifier: DepartmentSelectionBtnCell.reuseID) as? DepartmentSelectionBtnCell else {return UITableViewCell()}

            btnCell.delegate = self

            return btnCell
        }else{
            return UIView()
        }
    }
}

extension DepartmentSelection: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        department.depName = textField.text ?? ""
        depAdditionChecks(for: textField.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
