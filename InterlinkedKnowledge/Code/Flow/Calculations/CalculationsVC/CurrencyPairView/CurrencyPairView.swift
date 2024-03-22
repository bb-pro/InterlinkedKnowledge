//
//  CurrencyPairView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

struct CurrencyPair {
    let image: String
    let name: String
    let amount: String
    let profit: String
    let isRightHidden: Bool
}

final class CurrencyPairView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.cornerRadius = 10
        view.addSubview(currencyStack)
        view.addSubview(profitStack)
        view.addSubview(rightImgView)
        return view
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.tintColor = .clear
        btn.backgroundColor = .clear
        return btn
    }()
    
    private lazy var currencyPairImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var rightImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = .dollarsignArrow
        imgView.isHidden = true
        return imgView
    }()
    
    private lazy var pairLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 20)
        lbl.textColor = MyColors.black.color
        return lbl
    }()
    
    private lazy var amountLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 17)
        lbl.textColor = MyColors.black.color
        return lbl
    }()
    
    private lazy var profitLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 13)
        lbl.textColor = MyColors.green.color
        return lbl
    }()
    
    private lazy var currencyStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [currencyPairImgView, pairLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var profitStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [amountLabel, profitLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setUpViews()
        setUpConstraints()
        
    }
    
    func configure(with data: CurrencyPair) {
        currencyPairImgView.image = UIImage(named: data.image)
        pairLabel.text = data.name
        amountLabel.text = data.amount
        profitLabel.text = data.profit
        rightImgView.isHidden = data.isRightHidden
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        addSubview(containerView)
        addSubview(actionButton)
    }
    
    private func setUpConstraints() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        actionButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        currencyStack.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        profitStack.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        rightImgView.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview()
        }
    }
    
}
