//
//  TabBarController.swift
//  
//
//  Created by . on 01/12/23.
//

import UIKit

final class TabBarController: UITabBarController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        pushVC()
      
        if #available(iOS 15.0, *) {
            // Create a custom appearance instance
            let tabBarAppearance = UITabBarAppearance()

            // Apply the appearance to the tab bar
            self.tabBarController?.tabBar.standardAppearance = tabBarAppearance
        }
    }

    
    private func setTabbar() {
      
        // Configure the appearance
        let appearance = tabBar.standardAppearance
        // Apply the appearance to the tab bar
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = appearance
        }
        tabBar.tintColor = MyColors.tint.color
    }

    func pushVC() {
        let holidaysVC = HolidaysVC()
        holidaysVC.tabBarItem.title = "Holidays"
        holidaysVC.tabBarItem.image = .tabIcon1
        let holidaysVCC = UINavigationController(rootViewController: holidaysVC)
        
        let calculationsVC = BaseViewController()
        calculationsVC.tabBarItem.title = "Calculations"
        calculationsVC.tabBarItem.image = .tabIcon2
        let calculationsVCC = UINavigationController(rootViewController: calculationsVC)
        
        let settingsVC = SettingsVC()
        settingsVC.tabBarItem.title = "Settings"
        settingsVC.tabBarItem.image = .tabIcon3
        let settingsVCC = UINavigationController(rootViewController: settingsVC)
        
        self.viewControllers = [holidaysVCC, calculationsVCC, settingsVCC]
    }
}
