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
        nextPressed()
        contentView.nextButton.actionButton(target: self, action: #selector(nextPressed))
    }
    
    // MARK: - Actions
    
    @objc func nextPressed() {
        if currentIndex < onboardingData.count {
            contentView.updateUI(data: onboardingData[currentIndex])
            currentIndex += 1
        } else {
            UserDefaults.standard.set(true, forKey: "OnboardingCompleted")
            let tabBarVC = TabBarController()
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                sceneDelegate.window?.rootViewController = tabBarVC
                sceneDelegate.window?.makeKeyAndVisible()
            }
        }
    }

}
