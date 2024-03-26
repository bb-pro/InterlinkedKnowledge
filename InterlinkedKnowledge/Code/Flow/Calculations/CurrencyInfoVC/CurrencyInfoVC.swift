//
//  CurrencyInfoVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import UIKit

protocol CurrencyInfoVCDelegate: AnyObject {
    func selectedCurrencyItem(name: String)
}

final class CurrencyInfoVC: BaseViewController {

    var currency: CurrencyResult!
    
    private var contentView: CurrencyInfoView {
        view as? CurrencyInfoView ?? CurrencyInfoView()
    }
    
    weak var delegate: CurrencyInfoVCDelegate?
    
    override func loadView() {
        view = CurrencyInfoView()
        contentView.configure(with: currency)
        contentView.backBtn.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        contentView.applyBtn.addTarget(self, action: #selector(applyPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func applyPressed() {
        delegate?.selectedCurrencyItem(name: currency.resultCurrencyItem)
        dismissAllPresentedViewControllers()
    }
    
    @objc func backPressed() {
        dismissAllPresentedViewControllers()
    }
}
