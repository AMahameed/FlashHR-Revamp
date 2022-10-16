//
//  OnboardingView.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 11/10/2022.
//

import UIKit

class OnboardingContainerVC: UIViewController {
    
    let stackView = UIStackView()
    let onboardingImage = UIImageView()
    let onboardingLabel = UILabel()
    
    let onboardingImageName: String
    let onboardingText: String
    
    init(onboardingImageName: String, onboardingText: String) {
        self.onboardingImageName = onboardingImageName
        self.onboardingText = onboardingText

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingContainerVC {
    
    func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        onboardingImage.translatesAutoresizingMaskIntoConstraints = false
        onboardingImage.contentMode = .scaleAspectFit
        onboardingImage.image = UIImage(named: onboardingImageName)
        
        onboardingLabel.translatesAutoresizingMaskIntoConstraints = false
        onboardingLabel.textAlignment = .center
        onboardingLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        onboardingLabel.textColor = .secondaryLabel
        onboardingLabel.adjustsFontForContentSizeCategory = true
        onboardingLabel.numberOfLines = 0
        onboardingLabel.text = onboardingText
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(onboardingImage)
        stackView.addArrangedSubview(onboardingLabel)
        
        view.addSubview(stackView)
        
//        stackView
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
