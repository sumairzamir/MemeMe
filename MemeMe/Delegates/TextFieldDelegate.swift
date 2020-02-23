//
//  TextFieldTopDelegate.swift
//  MemeMe
//
//  Created by Sumair Zamir on 19/02/2020.
//  Copyright © 2020 Sumair Zamir. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UITexfField delegate

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Top" {
            textField.text = ""
     
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true;
    }
}
