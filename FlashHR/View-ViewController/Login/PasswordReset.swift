//
//  PasswordReset.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 07/10/2022.
//

import UIKit

class PasswordReset: UIViewController {
    let passwordResetView = PasswordResetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordResetView.delegate = self
        view.backgroundColor = .systemBackground
    }
    
    override func loadView() {
        super.loadView()
        view = passwordResetView
    }
}

//MARK: Submit and Back Buttons delegats

extension PasswordReset: PassResetButtonsPressed{
    func didPressSubmitBtn(button: UIButton) {
        self.dismiss(animated: true)
    }
    
    func didPressBackBtn(button: UIButton) {
        self.dismiss(animated: true)
    }
    
    
}

