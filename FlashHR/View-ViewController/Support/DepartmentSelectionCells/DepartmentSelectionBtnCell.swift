//
//  DepartmentSelectionBtnCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 20/10/2022.
//


import UIKit

class DepartmentSelectionBtnCell: UITableViewCell {
    
    let nextButton = UIButton(type: .custom)
    let stackView = UIView()
    
    static let reuseID = "DepartmentSelectionBtnCell"
    static let rowHeight: CGFloat = 120
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextPressed(_ sender: UIButton){
        print("foo - Next Pressed")
    }
}

//MARK: style and layout
extension DepartmentSelectionBtnCell{
    func setup() {
        
        backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration = .filled()
        nextButton.setTitle("Save & Next", for: [])
        nextButton.tintColor = UIColor(named: "blue")
        nextButton.addTarget(self, action: #selector(nextPressed), for: .primaryActionTriggered)
    }
    
    func layout() {
        
        stackView.addSubview(nextButton)
      
        contentView.addSubview(stackView)
        
//        UIVIEW
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.5),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1.5),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1.5)
        ])
        
//        nextButton
        NSLayoutConstraint.activate([
        
            nextButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.topAnchor, multiplier: 2),
            nextButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 2),
            stackView.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 2),
            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2)
            
        ])
    }
}
