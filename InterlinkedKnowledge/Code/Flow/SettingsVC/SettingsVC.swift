//
//  SettingsVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit
import StoreKit

final class SettingsVC: BaseViewController {

    private var contentView: SettingsView {
        view as? SettingsView ?? SettingsView()
    }
    
    override func loadView() {
        view = SettingsView()
        contentView.rateView.actionButton.addTarget(self, action: #selector(ratePressed), for: .touchUpInside)
        contentView.shareView.actionButton.addTarget(self, action: #selector(sharePressed), for: .touchUpInside)
        contentView.usageProfileView.actionButton.addTarget(self, action: #selector(usageProfilePressed), for: .touchUpInside)
        contentView.resetView.actionButton.addTarget(self, action: #selector(resetPressed), for: .touchUpInside)
    }

    
    // MARK: - Actions
    
    @objc func ratePressed() {
        if #available(iOS 14.0, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    @objc func sharePressed() {
        let shareText = "InterlinkedKnowledge"
        let activityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func usageProfilePressed() {
        
    }
    
    @objc func resetPressed() {
        
    }
}
