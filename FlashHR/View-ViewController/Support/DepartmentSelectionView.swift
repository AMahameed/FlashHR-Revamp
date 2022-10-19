//
//  DepartmentSelectionView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 19/10/2022.
//

import UIKit

class DepartmentSelectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DepartmentSelectionView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
    }
    
    func layout() {
        
    }
}
