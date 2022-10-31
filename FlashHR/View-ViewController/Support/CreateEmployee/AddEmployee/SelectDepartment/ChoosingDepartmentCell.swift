//
//  ChoosingDepartmentCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 29/10/2022.
//

import UIKit

class ChoosingDepartmentCell: UITableViewCell {
    
    var selectedDep = UIButton(configuration: .filled())
    
    static let reuseID = "ChoosingDepartmentCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectedDep.setTitle("", for: [])
    }
    
    @objc func selectedDepPressed(_ sender: UIButton){
        print(sender.titleLabel!)
        print(sender.tag)
    }
    
    func configureCell(at row: Int, with title: String) {
        selectedDep.setTitle(title, for: [])
        selectedDep.tag = row
    }
}

//MARK: style and layout
extension ChoosingDepartmentCell{
    func setup() {
        
        backgroundColor = .clear

        selectedDep.translatesAutoresizingMaskIntoConstraints = false
        selectedDep.tintColor = UIColor(named: "blue")
        selectedDep.addTarget(self, action: #selector(selectedDepPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        contentView.addSubview(selectedDep)

//        nextButton
        NSLayoutConstraint.activate([

            selectedDep.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2.5),
            selectedDep.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5),
            bottomAnchor.constraint(equalToSystemSpacingBelow: selectedDep.bottomAnchor, multiplier: 2.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: selectedDep.trailingAnchor, multiplier: 1.5)
        ])
    }
}
