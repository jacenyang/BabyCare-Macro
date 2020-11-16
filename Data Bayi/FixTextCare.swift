//
//  FixTextCare.swift
//  BabyCare-MC3
//
//  Created by Rian Anjasmara on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//
// MARK: - UITextField extension

import UIKit

extension UITextField {
    /// Moves the caret to the correct position by removing the trailing whitespace
    func fixCaretPosition() {
        // Moving the caret to the correct position by removing the trailing whitespace
        // http://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle

        let beginning = beginningOfDocument
        selectedTextRange = textRange(from: beginning, to: beginning)
        let end = endOfDocument
        selectedTextRange = textRange(from: end, to: end)
    }
}

