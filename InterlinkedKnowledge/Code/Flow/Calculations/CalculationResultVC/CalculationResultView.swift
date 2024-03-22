//
//  CalculationResultView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

final class CalculationResultView: UIView {
    
    private lazy var topImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .grabber
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.semibold, size: 17)
        label.textColor = MyColors.black.color
        label.text = "Result"
        return label
    }()
    
    private(set) lazy var addButton: TopRightButton = {
        let btn = TopRightButton(type: .custom)
        btn.titleLabel?.font = .customSFProFont(.semibold, size: 17)
        btn.setTitle("Save", for: .normal)
        btn.isEnabled = true
        return btn
    }()
    
    private lazy var coinImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .coin
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private(set) lazy var costLabel: UILabel = {
        let label = UILabel()
        label.textColor = MyColors.black.color
        label.font = .customSFProFont(.bold, size: 34)
        return label
    }()
    
    private lazy var resultView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.cornerRadius = 6
        
        let titleLabel = UILabel()
        titleLabel.text = "Cost of holiday"
        titleLabel.font = .customSFProFont(.semibold, size: 15)
        titleLabel.textColor = MyColors.black.color
    
        view.addSubview(titleLabel)
        view.addSubview(costLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(10)
        }
        
        costLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        return view
    }()
    
    private(set) lazy var closeBtn: CustomButtonView = {
        let btn = CustomButtonView()
        btn.btnUpdate(item: ButtonDM(icon: "", title: "Close", textColor: MyColors.white.color, backColor: MyColors.tint.color))
        return btn
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
        addSubview(coinImgView)
        addSubview(resultView)
        addSubview(closeBtn)
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
        
        coinImgView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.height.equalTo(147)
            make.width.equalTo(130)
        }
        
        resultView.snp.makeConstraints { make in
            make.top.equalTo(coinImgView.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(117)
        }
        
        closeBtn.snp.makeConstraints { make in
            make.top.equalTo(resultView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(45)
        }
        
    }
}
