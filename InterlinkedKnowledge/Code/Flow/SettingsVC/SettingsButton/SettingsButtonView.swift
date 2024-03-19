//
//  SettingsButtonView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit

final class SettingButtonView: UIView {
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = MyColors.bgSecond.color
        return view
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let topLabel: UILabel = {
        let label = UILabel()
        label.font = .customSFFont(.regular, size: 15)
        return label
    }()

    lazy var actionButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Initialization
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(containerView)
        containerView.addSubview(topLabel)
        containerView.addSubview(iconImageView)
        addSubview(actionButton)
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(71)
            make.edges.equalToSuperview()
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        topLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
        }

        actionButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setup(with item: ButtonDM) {
        containerView.backgroundColor = item.backColor
        containerView.layer.cornerRadius = 18
        topLabel.text = item.title
        if !item.icon.isEmpty {
            iconImageView.image = UIImage(systemName: item.icon)
            iconImageView.tintColor = item.textColor
        } else {
            iconImageView.image = nil
        }
    }

    
    // MARK: - Action
    
    @objc private func actionButtonTapped() {

    }
}
