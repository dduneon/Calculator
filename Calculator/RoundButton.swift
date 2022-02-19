//
//  RoundButton.swift
//  Calculator
//
//  Created by 준현의 Macbook Pro on 2022/02/19.
//

import UIKit

class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
}
