//
//  CurrencyInfoVCViewInstaller.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import UIKit

final class CurrencyInfoView: UIView {
    
    private lazy var topImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .grabber
        return imgView
    }()
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.semibold, size: 17)
        label.textColor = MyColors.black.color
        label.text = ""
        return label
    }()
    
    private lazy var currencyValueTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.bold, size: 13)
        lbl.textColor = MyColors.secondaryText.color
        lbl.text = "Currency value"
        return lbl
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.bold, size: 26)
        label.textColor = MyColors.black.color
        label.text = ""
        return label
    }()
    
    private lazy var profitLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.bold, size: 15)
        label.textColor = MyColors.green.color
        label.text = ""
        return label
    }()
    
    private lazy var graphImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .graph
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private(set) lazy var backBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(.backBtn, for: .normal)
        return btn
    }()
    
    private(set) lazy var applyBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(.applyBtn, for: .normal)
        return btn
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [backBtn, applyBtn])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with currency: CurrencyResult) {
        
        let amount = currency.resultBuyItem
        let profit = currency.resultSellItem - currency.resultBuyItem
        let profitPercent = currency.resultSellItem / currency.resultBuyItem
        let profitString = profit > 0 ? "$+\(profit)(\(profitPercent))" : "$\(profit)(\(profitPercent))"
        
        titleLabel.text = currency.resultCurrencyItem.dividedBySlash()
        valueLabel.text = "\(amount)"
        profitLabel.text = profitString
    }
    
    func setUpViews() {
        addSubview(topImgView)
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(profitLabel)
        addSubview(currencyValueTitle)
        addSubview(graphImgView)
        addSubview(buttonStack)
    }
    
    func setUpConstraints() {
        topImgView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(6)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(topImgView.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        currencyValueTitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(41)
            make.left.equalToSuperview().offset(16)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(currencyValueTitle.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
        }
        
        profitLabel.snp.makeConstraints { make in
            make.left.equalTo(valueLabel.snp.right).offset(8)
            make.bottom.equalTo(valueLabel.snp.bottom)
        }
        
        graphImgView.snp.makeConstraints { make in
            make.top.equalTo(profitLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview()
        }
        
        buttonStack.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-32)
            make.centerX.equalToSuperview()
        }
    }
}
