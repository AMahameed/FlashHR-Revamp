//
//  ViewController.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 06/10/2022.
//

import UIKit

class LoginVC: UIViewController {
    
    let stackView = UIStackView()
    let headerStackView = UIStackView()
    
    let emailTextField = LoginTextFieldView(textFieldType: "Email", isEmailTextfield: true)
    let passwordTextField = LoginTextFieldView(textFieldType: "Password",isEmailTextfield: false)
    
    let loginButton = UIButton(type: .system)
    
    let logoImage = UIImageView(image: UIImage(named: "logo"))
    let logoText = UILabel()
    
    let descriptionLabel = UILabel()
    let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animate()
    }
}

extension LoginVC {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.axis = .horizontal
        headerStackView.alpha = 0
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
//        signinButton.configuration?.imagePadding = 8
        loginButton.setTitle("Login ", for: [])
        loginButton.tintColor = UIColor(named: "blue")
        loginButton.addTarget(self, action: #selector(loginPressed), for: .primaryActionTriggered)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode = .scaleAspectFit
        
        logoText.translatesAutoresizingMaskIntoConstraints = false
        logoText.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        logoText.textColor = UIColor(named: "blue")
        logoText.text = "FlashHR"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "FlashHR is the perfect solution for all HR Duties"
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.alpha = 0
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.text = "Email or Password is incorrect, please try again"
        errorLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        errorLabel.numberOfLines = 0
        errorLabel.textColor = .systemRed
//        errorLabel.alpha = 0

    }

    func layout() {
    
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        headerStackView.addSubview(logoImage)
        headerStackView.addSubview(logoText)
        
        view.addSubview(headerStackView)
        view.addSubview(descriptionLabel)
        view.addSubview(stackView)
        view.addSubview(loginButton)
        view.addSubview(errorLabel)
        
        

//        textfield StackView
        NSLayoutConstraint.activate([
        
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 4)
        ])
        
//        login Button
        NSLayoutConstraint.activate([
        
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 8),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 4)
        ])
        
//        headerStackView
        NSLayoutConstraint.activate([

            logoImage.heightAnchor.constraint(equalToConstant: 75.0),
            logoImage.widthAnchor.constraint(equalToConstant: 75.0),
            logoText.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor),
            logoImage.centerYAnchor.constraint(equalTo: logoText.centerYAnchor),
            
            headerStackView.widthAnchor.constraint(equalToConstant: 230),
            headerStackView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 8),
            headerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        descriptionLabel
        NSLayoutConstraint.activate([
            
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.bottomAnchor, multiplier: 10),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 4)
        ])
        
//       Error Label
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
        
    }
    
    @objc func loginPressed(_ sender: UIButton){
        
    }
}

// MARK: - Animations
extension LoginVC {
    private func animate() {
        
        let duration = 1.0
        
        let animator = UIViewPropertyAnimator(duration: duration*1.5, curve: .easeInOut) {
            self.headerStackView.alpha = 1
            self.descriptionLabel.alpha = 1
        }
        
        animator.startAnimation()
    }
}
