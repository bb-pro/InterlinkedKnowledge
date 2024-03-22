//
//  ModalVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

class ModalVC: UIViewController, UIGestureRecognizerDelegate {

    var tap = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.delegate = self
        self.hideKeyboardWhenTappedAround()
        navigationController?.navigationBar.tintColor = MyColors.black.color

    }
    
    @objc open func dismissKeyboard() {
        view.endEditing(true)
    }
    
    open func hideKeyboardWhenTappedAround() {
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
