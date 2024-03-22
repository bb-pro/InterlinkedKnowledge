//
//  TopRightButton.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

class TopRightButton: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.tintColor = MyColors.tint.color
                self.setTitleColor(MyColors.tint.color, for: .normal)
            } else {
                self.tintColor = MyColors.secondaryText.color
                self.setTitleColor(MyColors.secondaryText.color, for: .normal)
            }
        }
    }
}
