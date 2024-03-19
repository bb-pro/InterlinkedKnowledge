//
//  SettingsView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit

final class SettingsView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.bold, size: 34)
        lbl.textColor = MyColors.black.color
        lbl.text = "Settings"
        return lbl
    }()
    
    private(set) lazy var rateView: SettingButtonView = {
        let rateView = SettingButtonView()
        rateView.setup(with: ButtonDM(
                              icon: "star.fill",
                              title: "Rate app",
                              textColor: MyColors.black.color,
                              backColor: MyColors.bgSecond.color))
        return rateView
    }()
    
    private(set) lazy var shareView: SettingButtonView = {
        let rateView = SettingButtonView()
        rateView.setup(with: ButtonDM(
                              icon: "square.and.arrow.up.fill",
                              title: "Share",
                              textColor: MyColors.black.color,
                              backColor: MyColors.bgSecond.color))
        return rateView
    }()
    
    private(set) lazy var usageProfileView: SettingButtonView = {
        let rateView = SettingButtonView()
        rateView.setup(with: ButtonDM(
                              icon: "",
                              title: "Usage Policy",
                              textColor: MyColors.black.color,
                              backColor: MyColors.bgSecond.color))
        return rateView
    }()
    
    private(set) lazy var resetView: SettingButtonView = {
        let rateView = SettingButtonView()
        rateView.setup(with: ButtonDM(
                              icon: "arrow.counterclockwise",
                              title: "Reset",
                              textColor: MyColors.black.color,
                              backColor: MyColors.bgSecond.color))
        return rateView
    }()
    
    private lazy var topStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rateView, shareView, usageProfileView])
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
        addSubview(titleLabel)
        addSubview(topStack)
        addSubview(resetView)
    }
    
    private func setUpConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalTo(safeAreaLayoutGuide).offset(16)
        }
        
        topStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
                make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        resetView.snp.makeConstraints { make in
            make.right.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
            make.left.equalToSuperview().offset(16)
        }
    }
}

