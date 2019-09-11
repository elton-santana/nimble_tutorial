//
//  UITextField+setTextAndSendEvent.swift
//  nimble_tutorial
//
//  Created by Elton Santana on 11/09/19.
//  Copyright © 2019 Memo. All rights reserved.
//


import UIKit

extension UITextField {
    func setTextAndSendEvent(_ text: String) {
        self.text = text
        self.sendActions(for: .editingChanged)
    }
}
