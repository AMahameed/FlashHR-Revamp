//
//  ChoosingDepartmentCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 29/10/2022.
//

import UIKit

class ChoosingDepartmentCell: UITableViewCell {
    
    var selectedDepOrLevel = UIButton(configuration: .filled())
    
    static let reuseID = "ChoosingDepartmentCell"
    var dismissHandler: ((Bool)->())? = nil
    
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
//        selectedDepOrLevel.setTitle("", for: [])
    }
    
    @objc func selectedDepOrLevelPressed(_ sender: UIButton){
        print(sender.titleLabel!)
        print(sender.tag)
        dismissHandler?(true)
    }
    
    func configureCell(at row: Int, with title: String) {
        selectedDepOrLevel.setTitle(title, for: [])
        selectedDepOrLevel.tag = row
    }
}

//MARK: style and layout
extension ChoosingDepartmentCell{
    func setup() {
        
        backgroundColor = .clear

        selectedDepOrLevel.translatesAutoresizingMaskIntoConstraints = false
        selectedDepOrLevel.tintColor = UIColor(named: "blue")
        selectedDepOrLevel.addTarget(self, action: #selector(selectedDepOrLevelPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        contentView.addSubview(selectedDepOrLevel)

//        nextButton
        NSLayoutConstraint.activate([

            selectedDepOrLevel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2.5),
            selectedDepOrLevel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5),
            bottomAnchor.constraint(equalToSystemSpacingBelow: selectedDepOrLevel.bottomAnchor, multiplier: 2.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: selectedDepOrLevel.trailingAnchor, multiplier: 1.5)
        ])
    }
}
