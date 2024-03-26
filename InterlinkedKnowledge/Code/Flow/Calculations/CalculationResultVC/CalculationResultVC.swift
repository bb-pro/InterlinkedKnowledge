//
//  CalculationResultVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

protocol CalculationResultVCDelegate: AnyObject {
    func savePressed() 
}

final class CalculationResultVC: BaseViewController {

    private var contentView: CalculationResultView {
        view as? CalculationResultView ?? CalculationResultView()
    }
    
    weak var delegate: CalculationResultVCDelegate?
    
    var name: String = ""
    var cost: Int32 = 0
 
    override func loadView() {
        view = CalculationResultView()
        contentView.closeBtn.actionButton(target: self, action: #selector(closePressed))
        contentView.addButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
        contentView.costLabel.text = "\(cost)"
    }

    // MARK: - Actions
    
    @objc func closePressed() {
        dismiss(animated: true)
    }

    @objc func savePressed() {
        dismiss(animated: true)
        CoreDataManager.shared.createHolidayCost(name: name, cost: cost)
        delegate?.savePressed()
    }
}
