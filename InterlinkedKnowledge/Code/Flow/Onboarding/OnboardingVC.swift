//
//  OnboardingVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit

final class OnboardingVC: BaseViewController {
    
    private var contentView: OnboardingView {
        view as? OnboardingView ?? OnboardingView()
    }
    
    private var currentIndex = 0
    private let onboardingData = OnboardingData.getOnboardingData()
    
    override func loadView() {
        view = OnboardingView()
        contentView.updateUI(data: onboardingData[currentIndex])
        contentView.nextButton.actionButton(target: self, action: #selector(nextPressed))
    }
    
    // MARK: - Actions
    
    @objc func nextPressed() {
        if currentIndex < onboardingData.count {
            print(onboardingData[currentIndex])
            currentIndex += 1
            contentView.updateUI(data: onboardingData[currentIndex])
        }
    }
}
