//
//  CalculationsVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

final class CalculationsVC: BaseViewController {
    
    private var contentView: CalculationsView {
        view as? CalculationsView ?? CalculationsView()
    }
    
    override func loadView() {
        view = CalculationsView()
        contentView.calculateBtn.actionButton(target: self, action: #selector(calculatePressed))
        contentView.segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
    }
    
    // MARK: - Actions
    
    @objc func segmentAction() {
        contentView.textfieldStack.isHidden = contentView.segmentedControl.selectedSegmentIndex == 1
    }
    
    @objc func calculatePressed() {
        let resultVC = CalculationResultVC()
        present(resultVC, animated: true)
    }
}
