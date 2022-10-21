//
//  Models.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 20/10/2022.
//

import Foundation

struct Department {
    let depName: String
    let depUID: String 
    
    init(depName: String, depUID: String) {
        self.depName = depName
        self.depUID = depUID
    }
}
