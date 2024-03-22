//
//  EditCardsVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

protocol EditCardDelegate: AnyObject {
    func editCardData(total: String, quantity: String)
}

final class EditCardsVC: ModalVC {
    
    var totalCount: String!
    var totalAmount: String!

    private var contentView: EditCardView {
        return view as? EditCardView ?? EditCardView()
    }
    
    weak var delegate: EditCardDelegate?
    
    override func loadView() {
        view = EditCardView()
        
        contentView.totalAmountView.field.text = totalAmount
        contentView.quantityView.field.text = totalCount
        
        contentView.quantityView.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.totalAmountView.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.addButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func savePressed() {
        guard let total = contentView.totalAmountView.field.text, let quantity = contentView.quantityView.field.text else {
            return
        }
        
        delegate?.editCardData(total: total, quantity: quantity)
        dismiss(animated: true)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let quantityText = contentView.quantityView.field.text,
              let totalText = contentView.totalAmountView.field.text,
              let _ = Int(quantityText),
              let _ = Int(totalText)
        else {
            contentView.addButton.isEnabled = false
            return
        }
        
        contentView.addButton.isEnabled = true
    }
}
