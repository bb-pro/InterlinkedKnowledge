//
//  OnboardingView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit
import SnapKit

final class OnboardingView: UIView {
    
    private lazy var progressImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.bold, size: 28)
        lbl.textColor = MyColors.black.color
        return lbl
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFFont(.regular, size: 15)
        lbl.textColor = MyColors.black.color.withAlphaComponent(0.4)
        return lbl
    }()
    
    private lazy var mainImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }()
    
    private(set) lazy var nextButton: CustomButtonView = {
        let button = CustomButtonView()
        button.btnUpdate(item: 
                            ButtonDM(
                                icon: "",
                                title: "Next",
                                textColor: MyColors.white.color,
                                backColor: MyColors.tint.color))
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(data: OnboardingData) {
        progressImageView.image = UIImage(named: data.progress)
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        mainImageView.image = UIImage(named: data.mainImage)
    }
    
    private func setUpViews() {
        backgroundColor = .white
        [progressImageView, mainImageView, titleLabel, subtitleLabel, nextButton].forEach{(addSubview($0))}
        
    }
    
    private func setUpConstraints() {
        progressImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(progressImageView.snp.bottom).offset(6)
            make.centerX.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-17)
        }
        
        nextButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(45)
        }
    }
}
