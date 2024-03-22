//
//  CalculationResultVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

final class CalculationResultVC: BaseViewController {

    private var contentView: CalculationResultView {
        view as? CalculationResultView ?? CalculationResultView()
    }
 
    override func loadView() {
        view = CalculationResultView()
        contentView.closeBtn.actionButton(target: self, action: #selector(closePressed))
        contentView.addButton.addTarget(self, action: #selector(savePressed), for: .touchUpInside)
    }

    // MARK: - Actions
    
    @objc func closePressed() {
        dismiss(animated: true)
    }

    @objc func savePressed() {
        dismiss(animated: true)
    }
}
