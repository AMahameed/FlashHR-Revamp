//
//  AddEmployeeCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//

import UIKit

class AddEmployeeCell: UITableViewCell{
    
    let view = UIView()
    let typeLabel = UILabel()
    let divider = UIView()
    let textField = UITextField()
    private var depOrLevelPickerView = UIPickerView()
    private var pickerAccessory = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
    private var levels = ["HR Manager", "HR Agent", "Manager", "Supervisor", "Regular"]
    private var deps = ["HR", "IT", "PR"]
    var depHandler: ((String)->())? = nil
    var levelHandler: ((String)->())? = nil
    
    static let reuseID = "AddEmployeeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
        depOrLevelPickerView.delegate = self
        depOrLevelPickerView.dataSource = self
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneBtnClicked(_:)))
        doneButton.tintColor = .label
        pickerAccessory.items = [doneButton]
    }
    
    @objc func doneBtnClicked(_ button: UIBarButtonItem?) {
        textField.resignFirstResponder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        textField.isSecureTextEntry = false
        textField.keyboardType = .default
        textField.inputView = nil
    }
    
    func configureCell(field type: String, info: String?, at row: Int, levelHandler: ((String)->())? = nil, depsHandler: ((String)->())? = nil){
        
        typeLabel.text = type
        textField.text = info ?? ""
        self.depHandler = depsHandler
        self.levelHandler = levelHandler
        
        switch row {
        case 1:
            textField.keyboardType = .emailAddress
        case 2:
            textField.isSecureTextEntry = true
        case 3:
            depOrLevelPickerView.tag = 1
            textField.placeholder = "Select department"
            textField.inputAccessoryView = pickerAccessory
            textField.inputView = self.depOrLevelPickerView
        case 4:
            depOrLevelPickerView.tag = 2
            textField.placeholder = "Select level"
            textField.inputAccessoryView = pickerAccessory
            textField.inputView = self.depOrLevelPickerView
        case 6:
            textField.keyboardType = .numberPad
        default:
            break
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: Cell style and layout

extension AddEmployeeCell: UITextFieldDelegate{
    func setup(){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        
        depOrLevelPickerView.translatesAutoresizingMaskIntoConstraints = false
        depOrLevelPickerView.sizeToFit()
 
        pickerAccessory.translatesAutoresizingMaskIntoConstraints = false
        pickerAccessory.barStyle = .default
        pickerAccessory.sizeToFit()

        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .body)

        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "blue")
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray5
        textField.clearsOnBeginEditing = true
        textField.delegate = self
    }
    
    func layout(){
        
        view.addSubview(typeLabel)
        view.addSubview(divider)
        view.addSubview(textField)
        
        contentView.addSubview(view)
        
//       view
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
//        depLabel
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 0.5),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3.5)
        ])
        
//        divider
        NSLayoutConstraint.activate([
            divider.heightAnchor.constraint(equalToConstant: 2),
            divider.widthAnchor.constraint(equalToConstant: 75),
            divider.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 0.5),
            divider.leadingAnchor.constraint(equalTo: typeLabel.leadingAnchor),
        ])
        
//        depTextfield
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalToSystemSpacingBelow: divider.bottomAnchor, multiplier: 1),
            textField.leadingAnchor.constraint(equalTo: divider.leadingAnchor),
            trailingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 3.5)
        ])
    }
}

extension AddEmployeeCell: UIPickerViewDelegate, UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1{ return deps.count}else{ return levels.count }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1{ return deps[row] }else{ return levels[row] }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1{
            let dep = deps[row]
            textField.text = dep
            depHandler?(dep)
//            textField.resignFirstResponder()
        }else{
            let level = levels[row]
            textField.text = level
            levelHandler?(level)
//            textField.resignFirstResponder()
        }
    }
}
