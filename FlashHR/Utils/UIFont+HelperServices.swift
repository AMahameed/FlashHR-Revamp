//
//  UIFont.swift
//  FlashHR
//
//  Created by Abdallah Mahameed on 18/10/2022.
//

import UIKit

extension UIFont {
    func withTraits(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }

    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }

    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}

class HelperServices {
    
    func partialBoldString(_ attString: String, _ normalString: String) -> NSMutableAttributedString {
        let boldText = attString
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)]
        let attributedString = NSMutableAttributedString(string:boldText, attributes: attrs)
        let normalText = normalString
        let normalString = NSMutableAttributedString(string: normalText)
        attributedString.append(normalString)
        return attributedString
    }
    
    func instantiateNavCon(){
        
    }
}
