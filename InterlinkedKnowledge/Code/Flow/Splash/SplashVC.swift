//
//  SplashVC.swift
//  FeelTrace
//
//  Created by Bektemur Mamashayev on 4/3/2024.
//

import Foundation
import UIKit

protocol SceneDelegateDelegate: AnyObject {
    func changeRootViewController()
}


final class SplashVC: BaseViewController {
        
    weak var delegate: SceneDelegateDelegate?
    
    private var contentView: SplashView {
        view as? SplashView ?? SplashView()
    }
    
    override func loadView() {
        view = SplashView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startProgress()
    }
    
    func startProgress() {
        contentView.activityIndicator.startAnimating()
        contentView.timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            contentView.percent += 1
            contentView.percentLabel.text = "\(contentView.percent)%"
            if contentView.percent >= 100 {
                contentView.timer?.invalidate()
                contentView.timer = nil
                contentView.percentLabel.text = "100%"
                delegate?.changeRootViewController()
            }
        }
    }
    

}
