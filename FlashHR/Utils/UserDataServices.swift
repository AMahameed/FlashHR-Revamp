//
//  UserDataServices.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 12/10/2022.
//

import Foundation

class UserDataServices{
    
    static let shared = UserDataServices()
    
    var isSupport1: Bool{
        return LocalState.userID == Constans.Support.support1
    }
    var isSupport2: Bool{
        return LocalState.userID == Constans.Support.support2
    }
}
