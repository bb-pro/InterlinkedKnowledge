//
//  AddHolidayVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

protocol DismissDelegate: AnyObject {
    func dismiss()
}

final class AddHolidayVC: ModalVC {
    private var contentView: AddHolidayView {
        return view as? AddHolidayView ?? AddHolidayView()
    }
    
    weak var delegate: DismissDelegate?
    
    private let coreDataManager = CoreDataManager.shared
    
    var holiday: Holiday?
    
    override func loadView() {
        view = AddHolidayView()
        setupTargets()
        
        if let holiday = holiday {
            contentView.updateUI(with: holiday)
        }
    }
    
    // MARK: - Actions
    
    private func setupTargets() {
        contentView.nameTFView.field.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contentView.costTFView.field.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contentView.purchaseTFView.field.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        contentView.addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        updateAddButtonState()
    }
    
    @objc private func textFieldDidChange() {
        updateAddButtonState()
    }
    
    private func updateAddButtonState() {
        let nameText = contentView.nameTFView.field.text ?? ""
        let costText = contentView.costTFView.field.text ?? ""
        let purchaseText = contentView.purchaseTFView.field.text ?? ""
        
        let isAnyFieldEmpty = nameText.isEmpty || costText.isEmpty || purchaseText.isEmpty
        contentView.addButton.isEnabled = !isAnyFieldEmpty
    }
    
    @objc private func addButtonPressed() {
        guard let name = contentView.nameTFView.field.text,
              let costString = contentView.costTFView.field.text,
              let cost = Int16(costString),
              let purchases = contentView.purchaseTFView.field.text else {
            return
        }
        let date = contentView.datePicker.date
        
        if let holiday = holiday {
            coreDataManager.editHoliday(holiday, name: name, cost: cost, date: date, purchases: purchases)
        } else {
            coreDataManager.createHoliday(name: name, cost: cost, date: date, purchases: purchases)
        }
        delegate?.dismiss()
        dismissAllPresentedViewControllers()
    }
}

