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
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        title = "Company Selection"
//        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "blue")
    }
    override func loadView() {
        super.loadView()
        view = comSelectionView
    }
}

extension CompanySelection: nextPerssedInComSelection {
    func nextDidPress() {
        navigationController?.pushViewController(comSelectionView.depVC, animated: true)
    }
}

extension CompanySelection: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
