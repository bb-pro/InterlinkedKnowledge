//
//  CustomTextFieldView.swift
//  EPayments
//
//  Created by Bektemur Mamashayev on 23/10/2023.
//


import UIKit
import SnapKit

class CustomTextFieldView: UIView {
    
    let field = UITextField()
    
    let titleLabel = UILabel()
    
    init(title: String? = nil,
         placeholder: String? = nil,
         fieldCornerRadius: CGFloat = 0) {
        
        super.init(frame: .zero)
        addSubview(field)
        addSubview(titleLabel)
        style()
        layout()
        titleLabel.text = title
        field.placeholder = placeholder
        self.field.keyboardType = .default
        self.field.placeholder = placeholder
        self.field.leftViewMode = .always
        self.field.rightViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
        layout()
    }
    
    private func style() {
        field.delegate = self
        self.backgroundColor = .white
        self.layer.cornerRadius = 6
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        field.keyboardType = .decimalPad
        field.autocorrectionType = .no
        field.delegate = self
        field.inputAccessoryView = inputAccessoryView
        field.textContentType = .none
        
        titleLabel.textColor = MyColors.black.color
        titleLabel.font = .customSFProFont(.semibold, size: 15)
        titleLabel.textAlignment = .left
        
    }
    
    private func layout() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.alignment = .leading
        addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(field)
        
        stackView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }


}

extension CustomTextFieldView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newText = string.replacingOccurrences(of: ",", with: ".")
        
        guard let currentText = textField.text else { return true }
        
        let combinedText = (currentText as NSString).replacingCharacters(in: range, with: newText)
        
        return combinedText.count <= 10
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        self.layer.borderColor = MyColors.black.color.cgColor
    }
}
