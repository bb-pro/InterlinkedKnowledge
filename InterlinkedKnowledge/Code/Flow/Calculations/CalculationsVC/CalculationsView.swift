//
//  CalculationsView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

final class CalculationsView: UIView {
    
    private lazy var currencyView: CurrencyPairView = {
        let view = CurrencyPairView()
        view.configure(with: CurrencyPair(
            image: "pair1",
            name: "EUR/USD",
            amount: "",
            profit: "",
            isRightHidden: false))
        return view
    }()
    
    private(set) lazy var editButton: CustomButtonView = {
        let btn = CustomButtonView()
        btn.btnUpdate(item: ButtonDM(
            icon: "",
            title: "Edit",
            textColor: MyColors.white.color,
            backColor: MyColors.tint.color))
        return btn
    }()
    
    private(set) lazy var calculateBtn: CustomButtonView = {
        let btn = CustomButtonView()
        btn.btnUpdate(item: ButtonDM(
            icon: "",
            title: "Calculate",
            textColor: MyColors.white.color,
            backColor: MyColors.tint.color))
        return btn
    }()
    
    private(set) lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Calculator", "Saved"])
        control.selectedSegmentIndex = 0
        control.snp.makeConstraints { make in
            make.height.equalTo(28)
        }
        return control
    }()
    
    private lazy var segmentStack: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.text = "Holiday cost calculations"
        titleLabel.font = .customSFProFont(.semibold, size: 20)
        titleLabel.textColor = MyColors.black.color
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, segmentedControl])
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private(set) lazy var nameTFView: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Name holiday", placeholder: "Enter")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()
    
    private(set) lazy var giftTF: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Gifts", placeholder: "Enter amount")
        view.field.keyboardType = .numberPad
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()
    
    private(set) lazy var mealTF: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Meal", placeholder: "Enter amount")
        view.field.keyboardType = .numberPad
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()
    
    private(set) lazy var drinksTF: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Drinks", placeholder: "Enter amount")
        view.field.keyboardType = .numberPad
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()
    
    private(set) lazy var rentTF: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Rent a room", placeholder: "Enter amount")
        view.field.keyboardType = .numberPad
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()
    
    private(set) lazy var decoratingTF: CustomTextFieldView = {
        let view = CustomTextFieldView(title: "Decorationg", placeholder: "Enter amount")
        view.field.keyboardType = .numberPad
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.placeholderText.cgColor
        return view
    }()

    private(set) lazy var textfieldStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameTFView, giftTF, mealTF, drinksTF, rentTF, decoratingTF, calculateBtn])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 14
        return stackView
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.register(HolidayCell.self, forCellReuseIdentifier: HolidayCell.id)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        return tableView   
    }()
    
    private(set) lazy var centerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFFont(.regular, size: 17)
        lbl.textColor = MyColors.secondaryText.color
        lbl.text = "Your saved calculations\nwill be stored here"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(editButton)
        addSubview(currencyView)
        addSubview(segmentStack)
        addSubview(textfieldStack)
    }
    
    func setUpConstraints() {
        currencyView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(84)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(70)
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(currencyView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        segmentStack.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        calculateBtn.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        textfieldStack.snp.makeConstraints { make in
            make.top.equalTo(segmentStack.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
