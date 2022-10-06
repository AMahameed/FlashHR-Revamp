//
//  UITextFieldSecureToggle.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 07/10/2022.
//

import UIKit

let passwordToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enableSecureToggle()  {
        passwordToggleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToggleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToggleButton.addTarget(self, action: #selector(eyeTogglePressed), for: .touchUpInside)
        passwordToggleButton.tintColor = UIColor(named: "blue")
        rightView = passwordToggleButton
        rightViewMode = .always
        
    }
    
    @objc func eyeTogglePressed(_ sender: Any){
        isSecureTextEntry.toggle()
        passwordToggleButton.isSelected.toggle()
    }
}
