//
//  TextFieldDelegate.swift
//  HowToPickImageFromImagepicker
//
//  Created by Dimasno1 on 06.02.2018.
//  Copyright © 2018 Dimasno1. All rights reserved.
//

import Foundation
import UIKit

class CustomTextFieldDelegate: NSObject, UITextFieldDelegate{
    
    
    func setProperties(for textField: UITextField){
        textField.autocapitalizationType = .allCharacters
        textField.defaultTextAttributes = attributedText
        textField.backgroundColor = .clear
        textField.borderStyle = .none
        textField.textAlignment = .center
    }
    
    let attributedText: [String: Any] = [
        NSAttributedStringKey.strokeWidth.rawValue : -4,
        NSAttributedStringKey.foregroundColor.rawValue: UIColor.white,
        NSAttributedStringKey.strokeColor.rawValue: UIColor.black,
        NSAttributedStringKey.font.rawValue: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        ]
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == ""{
            textField.text = "Any idea?"
        }
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
}
