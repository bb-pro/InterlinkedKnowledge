//
//  OnboardingData.swift
//  FeelTrace
//
//  Created by Bektemur Mamashayev on 5/3/2024.
//

import Foundation

struct OnboardingData: Codable {
    var title: String
    var subtitle: String
    var progress: String
    var mainImage: String
    
    static func getOnboardingData() -> [OnboardingData] {
        [
            OnboardingData(
                title: "Keep records of holidays",
                subtitle: "Write down all the most important things",
                progress: "progress1",
                mainImage: "onboarding1"
            ),
            OnboardingData(
                title: "Calculate your expenses",
                subtitle: "All expenses are accounted for",
                progress: "progress2",
                mainImage: "onboarding2"
            ),
            OnboardingData(
                title: "Your exact calculations",
                subtitle: "Save your calculations",
                progress: "progress3",
                mainImage: "onboarding3"
            )
        ]
    }
}
