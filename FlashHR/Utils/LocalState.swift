//
//  LocalState.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 12/10/2022.
//

import Foundation

struct LocalState {
    
    private enum Keys: String{
        case hasOnboarded
        case userID
    }
    
    public static var hasOnboarded: Bool{
        
        get{return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)}
        set(newValue){UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)}
//            UserDefaults.standard.synchronize()}
    }
    
    public static var userID: String?{
        get{return UserDefaults.standard.string(forKey: Keys.userID.rawValue)}
        set (newValue) {UserDefaults.standard.set(newValue, forKey: Keys.userID.rawValue)}
    }
}
