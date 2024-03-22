//
//  TotalInfoView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit

struct TotalData {
    let iconName: String
    let title: String
    let total: String
}

final class TotalInfoView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 15)
        lbl.textColor = MyColors.darkGray.color
        return lbl
    }()
    
    private lazy var totalLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.bold, size: 22)
        lbl.textColor = MyColors.darkGray.color
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.snp.makeConstraints { make in
            make.width.equalTo(61)
            make.height.equalTo(71)
        }
        return imgView
    }()
    
    init() {
        super.init(frame: .zero)
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        [titleLabel, totalLabel, iconImageView].forEach( {containerView.addSubview($0)} )
        addSubview(containerView)
    }
    
    private func setUpConstraints() {

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-12)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-24)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview()
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configure(with data: TotalData) {
        iconImageView.image = UIImage(named: data.iconName)
        titleLabel.text = data.title
        totalLabel.text = data.total
    }
    
    func configure(with total: Int16) {
        totalLabel.text = "\(total)"
    }
    
    func configure(wtih total: String) {
        totalLabel.text = total
    }
}
