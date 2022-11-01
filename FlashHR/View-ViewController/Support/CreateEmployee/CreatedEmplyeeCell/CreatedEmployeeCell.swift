//
//  CreatedEmployeeCell.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 23/10/2022.
//

import UIKit

class CreatedEmployeeCell: UITableViewCell {
    
    let view = UIView()
    let labelStackView = UIStackView()
    
    let image = UIImageView()
    let nameLabel = UILabel()
    let titleLabel = UILabel()
    let levelLabel = UILabel()
    let statusLabel = UILabel()
    
    static let reuseID = "CreatedEmployeeCell"
    
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
    }
    
    func configure(name: String, title: String, level: String, status: Bool){ //, isDeleted: Bool
        nameLabel.text = name
        titleLabel.text = title
        levelLabel.text = level
        statusLabel.text = status ? "Not Active" : "Active"
        statusLabel.textColor = status ? UIColor.systemRed : UIColor.systemGreen
//        empImage.image = UIImage(data: img)
//        stackView.backgroundColor = isDeleted ? UIColor.systemGray : UIColor(named: "whiteBlue")
//        isUserInteractionEnabled = isDeleted ? false : true
    }
}

//MARK: Cell style and layout
extension CreatedEmployeeCell {
    
    func setup(){
        backgroundColor = .systemBackground
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "whiteBlue")
        view.layer.cornerRadius = 10
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "userPhoto")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        labelStackView.spacing = 5
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .label
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.5
       
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        titleLabel.textColor = .label
//        titleLabel.adjustsFontSizeToFitWidth = true
//        titleLabel.minimumScaleFactor = 0.5
//        titleLabel.numberOfLines = 1
        
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        levelLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        levelLabel.textColor = .label
//        levelLabel.adjustsFontSizeToFitWidth = true
//        levelLabel.minimumScaleFactor = 0.5
//        levelLabel.numberOfLines = 1
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
//        statusLabel.adjustsFontSizeToFitWidth = true
//        statusLabel.minimumScaleFactor = 0.5
//        statusLabel.numberOfLines = 1
    }
    
    func layout() {
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(levelLabel)
        labelStackView.addArrangedSubview(statusLabel)
        
        view.addSubview(image)
        view.addSubview(labelStackView)
        
        addSubview(view)
        
//        Main stackView
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: view.trailingAnchor, multiplier: 2),
            view.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        
//        image
        NSLayoutConstraint.activate([
            
            image.heightAnchor.constraint(equalToConstant: 110),
            image.widthAnchor.constraint(equalToConstant: 110),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
        
//        labelStackView
        NSLayoutConstraint.activate([
            
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: image.trailingAnchor, multiplier: 2)
        ])
        
    }
}
