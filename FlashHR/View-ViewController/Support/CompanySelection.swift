//
//  CompanySelection.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 18/10/2022.
//

import UIKit

class CompanySelection: UIViewController {
    
    let comSelectionView = CompanySelectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comSelectionView.delegate = self
    }
    
    override func loadView() {
        super.loadView()
        view = comSelectionView
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        title = "Company Selection"
    }
}

extension CompanySelection: nextPerssedInComSelection {
    
    func didPressNext() {
        navigationController?.pushViewController(comSelectionView.depVC, animated: true)
    }
}

extension CompanySelection: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
