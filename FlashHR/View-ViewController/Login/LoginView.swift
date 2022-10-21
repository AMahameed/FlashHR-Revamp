//
//  LoginView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 14/10/2022.
//

protocol LoginButtonsPressed: AnyObject {
    func didPressloginBtnToOnboading(button: UIButton)
    func didPressloginBtnToCompanySelection(button: UIButton)
    func didPressPassResetBtn(button: UIButton)
}

import UIKit

class LoginView: UIView {
    
    let headerStackView = UIStackView()
    let passReset = PasswordReset()
    let onboardingvVC = OnboardingVC()
    let loginTextFieldView = LoginTextFieldView()
    let comSelectionVC = CompanySelection()
    
    var comSelNC: UINavigationController!
    
    let loginButton = UIButton(type: .system)
    
    let passResetButton = UIButton(type: .system)
    
    let logoImage = UIImageView(image: UIImage(named: "logo"))
    let logoText = UILabel()
    
    let descriptionLabel = UILabel()
    let errorLabel = UILabel()
    
    var emailTextfieldEntry: String?{
        return  loginTextFieldView.usernameTextfield.text
    }
    var passTextfieldEntry: String?{
        return loginTextFieldView.passwordTextfield.text}
    
    weak var delegate: LoginButtonsPressed?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
        animate()
        errorLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func loginPressed(_ sender: UIButton){
        
        if emailTextfieldEntry?.isEmpty == false || passTextfieldEntry?.isEmpty == false {
            errorLabel.isHidden = false
            shakeButton()
        }else{
            errorLabel.isHidden = true
            
            if !LocalState.hasOnboarded{
                onboardingvVC.modalPresentationStyle = .fullScreen
                delegate?.didPressloginBtnToOnboading(button: loginButton)
            }else{
                comSelNC = UINavigationController(rootViewController: comSelectionVC)
                comSelNC.modalPresentationStyle = .fullScreen
                delegate?.didPressloginBtnToCompanySelection(button: loginButton)
            }
        }
    }
    
    @objc func resetPassPressed(_ sender: UIButton){
        delegate?.didPressPassResetBtn(button: sender)
    }
    
}

//MARK: style and layout
extension LoginView {
    func style() {
        backgroundColor = .systemBackground
        
        loginTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.axis = .horizontal
        headerStackView.alpha = 0 // for animation purposes
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        //        signinButton.configuration?.imagePadding = 8
        loginButton.setTitle("Login", for: [])
        loginButton.tintColor = UIColor(named: "blue")
        loginButton.addTarget(self, action: #selector(loginPressed), for: .primaryActionTriggered)
        
        passResetButton.translatesAutoresizingMaskIntoConstraints = false
        passResetButton.tintColor = .secondaryLabel
        passResetButton.setTitle("Forgot password? ", for: [])
        passResetButton.addTarget(self, action: #selector(resetPassPressed), for: .primaryActionTriggered)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.contentMode = .scaleAspectFit
        
        logoText.translatesAutoresizingMaskIntoConstraints = false
        logoText.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        logoText.textColor = UIColor(named: "blue")
        logoText.text = "FlashHR"
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "HR work made simple"
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.alpha = 0 // for animation purposes
        descriptionLabel.textAlignment = .center
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textAlignment = .center
        errorLabel.text = "Email or Password is incorrect, please try again"
        errorLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        errorLabel.numberOfLines = 0
        errorLabel.textColor = .systemRed
        errorLabel.isHidden = true
    }
    
    func layout() {
        
        headerStackView.addSubview(logoImage)
        headerStackView.addSubview(logoText)
        
        addSubview(headerStackView)
        addSubview(descriptionLabel)
        addSubview(loginTextFieldView)
        addSubview(passResetButton)
        addSubview(loginButton)
        addSubview(errorLabel)
        
        //        textfield StackView
        NSLayoutConstraint.activate([
            
            loginTextFieldView.centerYAnchor.constraint(equalTo: centerYAnchor),
            loginTextFieldView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: loginTextFieldView.trailingAnchor, multiplier: 4)
        ])
        
        //        login Button
        NSLayoutConstraint.activate([
            
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: passResetButton.bottomAnchor, multiplier: 8),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 4)
        ])
        
        //        headerStackView
        NSLayoutConstraint.activate([
            
            logoImage.heightAnchor.constraint(equalToConstant: 75.0),
            logoImage.widthAnchor.constraint(equalToConstant: 75.0),
            logoText.leadingAnchor.constraint(equalTo: logoImage.trailingAnchor),
            logoImage.centerYAnchor.constraint(equalTo: logoText.centerYAnchor),
            
            headerStackView.widthAnchor.constraint(equalToConstant: 230),
            headerStackView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 8),
            headerStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //        descriptionLabel
        NSLayoutConstraint.activate([
            
            descriptionLabel.topAnchor.constraint(equalToSystemSpacingBelow: headerStackView.bottomAnchor, multiplier: 10),
            descriptionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: descriptionLabel.trailingAnchor, multiplier: 4)
        ])
        
        //       Error Label
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor)
        ])
        
        //        passResetButton
        NSLayoutConstraint.activate([
            
            passResetButton.topAnchor.constraint(equalToSystemSpacingBelow: loginTextFieldView.bottomAnchor, multiplier: 1),
            passResetButton.leadingAnchor.constraint(equalTo: loginTextFieldView.leadingAnchor)
        ])
    }
}

// MARK: - Animations
extension LoginView {
    private func animate() {
        
        let duration = 1.0
        
        let animator = UIViewPropertyAnimator(duration: duration*1.5, curve: .easeInOut) {
            self.headerStackView.alpha = 1
            self.descriptionLabel.alpha = 1
        }
        
        animator.startAnimation()
    }
    
    private func shakeButton() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 10, -10, 10, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.3
        
        animation.isAdditive = true
        loginButton.layer.add(animation, forKey: "shake")
    }
}
