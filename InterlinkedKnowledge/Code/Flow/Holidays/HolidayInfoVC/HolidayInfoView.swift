//
//  HolidayInfoView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

final class HolidayInfoView: UIView {
    
    private lazy var topImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .grabber
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFProFont(.semibold, size: 17)
        label.textColor = MyColors.black.color
        label.text = "Oliver's birthday"
        return label
    }()
    
    private(set) lazy var editButton: TopRightButton = {
        let btn = TopRightButton(type: .custom)
        btn.titleLabel?.font = .customSFProFont(.semibold, size: 17)
        btn.setImage(UIImage(systemName: "pencil"), for: .normal)
        btn.isEnabled = true
        return btn
    }()
    
    private(set) lazy var deleteButton: TopRightButton = {
        let btn = TopRightButton(type: .custom)
        btn.titleLabel?.font = .customSFProFont(.semibold, size: 17)
        btn.setImage(UIImage(systemName: "trash"), for: .normal)
        btn.isEnabled = true
        return btn
    }()
    
    private lazy var giftImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = .giftFill
        return imgView
    }()
    
    private lazy var costView: TotalInfoView = {
        let view = TotalInfoView()
        view.configure(with: TotalData(iconName: "dollarSign", title: "Cost", total: "$"))
        return view
    }()
    
    private lazy var dateView: TotalInfoView = {
        let view = TotalInfoView()
        view.configure(with: TotalData(iconName: "calendar-circle", title: "Date and time", total: "15 Feb 2024 03:00 AM"))
        return view
    }()
    
    private lazy var topStack: UIStackView = {
        let topStack = UIStackView(arrangedSubviews: [costView, dateView])
        topStack.axis = .horizontal
        topStack.distribution = .fillEqually
        topStack.spacing = 16
        return topStack
    }()
    
    private(set) lazy var purchasesLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFFont(.regular, size: 17)
        label.textColor = MyColors.black.color
        return label
    }()
    
    private lazy var purchasesView: UIView = {
        
        let titleLbl = UILabel()
        titleLbl.font = .customSFFont(.regular, size: 17)
        titleLbl.textColor = MyColors.black.color
        titleLbl.text = "Purchases"
      
        
        let bottomImgView = UIImageView()
        bottomImgView.image = .korzinka
        
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.cornerRadius = 6
        view.addSubview(titleLbl)
        view.addSubview(purchasesLabel)
        view.addSubview(titleLbl)
        view.addSubview(bottomImgView)
        
        bottomImgView.snp.makeConstraints { make in
            make.width.equalTo(61)
            make.height.equalTo(73)
            make.bottom.right.equalToSuperview()
        }
        
        titleLbl.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(10)
        }
        
        purchasesLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLbl.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(with holiday: Holiday) {
        costView.configure(with: TotalData(iconName: "dollarSign", title: "Cost", total: "\(holiday.cost)"))
        
        dateView.configure(with: TotalData(iconName: "calendar-circle", title: "Date and time", total: holiday.date?.formatted() ?? Date().formatted()))
        
        purchasesLabel.text = holiday.purchases
    }
    
    func setUpViews() {
        addSubview(topImgView)
        addSubview(editButton)
        addSubview(deleteButton)
        addSubview(topStack)
        addSubview(giftImgView)
        addSubview(purchasesView)
        addSubview(titleLabel)
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
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-16)
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalTo(deleteButton.snp.left).offset(-16)
        }
        
        giftImgView.snp.makeConstraints { make in
            make.height.width.equalTo(118)
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
        topStack.snp.makeConstraints { make in
            make.top.equalTo(giftImgView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(117)
        }
        
        purchasesView.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(353)
        }
    }
}
