//
//  DepartmentSelectionBtnCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 20/10/2022.
//

protocol nextPerssedInDepSelection: AnyObject{
    func didPressNextOrSave(_ button: UIButton)
}

import UIKit

class DepartmentSelectionBtnCell: UITableViewCell {
    
    let nextButton = UIButton(type: .custom)
    
    weak var delegate: nextPerssedInDepSelection?
    
    static let reuseID = "DepartmentSelectionBtnCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func nextPressed(_ sender: UIButton){
        delegate?.didPressNextOrSave(sender)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nextButton.setTitle("", for: [])
    }
    
    func configureBtnCell(at row: Int) {

        switch row {
        case 3:
            nextButton.setTitle("select Department", for: [])
            nextButton.tag = 1
        case 4:
            nextButton.setTitle("select Level", for: [])
            nextButton.tag = 2
        case 7:
            nextButton.setTitle("save", for: [])
            nextButton.tag = 3
        default:
            break
        }
    }
}

//MARK: style and layout
extension DepartmentSelectionBtnCell{
    func setup() {
        
        backgroundColor = .systemBackground
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.configuration = .filled()
        nextButton.setTitle("Save & Next", for: [])
        nextButton.tintColor = UIColor(named: "blue")
        nextButton.addTarget(self, action: #selector(nextPressed), for: .primaryActionTriggered)
        
    }
    
    func layout() {
        
        contentView.addSubview(nextButton)
        
//        nextButton
        NSLayoutConstraint.activate([
        
            nextButton.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 3.5),
            nextButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3.5),
            bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 3.5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 3.5)
            
        ])
    }
}
