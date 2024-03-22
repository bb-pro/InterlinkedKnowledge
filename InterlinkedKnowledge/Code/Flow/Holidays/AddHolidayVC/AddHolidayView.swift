//
//  AddHolidayView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit
import SnapKit

final class AddHolidayView: UIView {
    
    private lazy var topImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .grabber
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.semibold, size: 17)
        label.textColor = MyColors.black.color
        label.text = "New holidays"
        return label
    }()
    
    private(set) lazy var addButton: TopRightButton = {
        let btn = TopRightButton(type: .custom)
        btn.titleLabel?.font = .customSFProFont(.semibold, size: 17)
        btn.setTitle("Add", for: .normal)
        btn.isEnabled = false
        return btn
    }()
    
    private(set) lazy var nameTFView: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Name", placeholder: "Enter")
        view.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        return view
    }()
    
    private(set) lazy var costTFView: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Cost", placeholder: "Enter")
        view.field.keyboardType = .numberPad
        return view
    }()
    
    private(set) lazy var purchaseTFView: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Purchase", placeholder: "Enter")
        return view
    }()
    
    private(set) lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .dateAndTime
        return datePicker
    }()
    
    private lazy var dateStack: UIStackView = {
        let dateLabel = UILabel()
        dateLabel.text = "Date and time"
        dateLabel.font = .customSFProFont(.semibold, size: 15)
        dateLabel.textColor = MyColors.black.color
        
        let dateStack = UIStackView(arrangedSubviews: [dateLabel, datePicker])
        dateStack.axis = .horizontal
        dateStack.spacing = 16
        datePicker.tintColor = MyColors.black.color
        
        return dateStack
    }()
    
    private lazy var mainStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTFView, costTFView, dateStack, purchaseTFView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        self.backgroundColor = MyColors.smokeWhite.color
        addSubview(topImgView)
        addSubview(addButton)
        addSubview(titleLabel)
        addSubview(mainStack)
    }
    
    private func setUpConstraints() {
        topImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topImgView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
        }
        
        mainStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(41)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
}


