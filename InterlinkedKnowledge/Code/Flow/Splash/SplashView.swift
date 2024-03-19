//
//  SplashView.swift
//  FeelTrace
//
//  Created by Bektemur Mamashayev on 4/3/2024.
//

import UIKit
import SnapKit

class SplashView: UIView {
    private lazy var mainLogoImage: UIImageView = {
        let image = UIImageView()
        image.image = .mainLogo
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private(set) lazy var loadView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.tintColor = MyColors.tint.color
        indicator.color = MyColors.tint.color
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    private(set) lazy var percentLabel: UILabel = {
        let label = UILabel()
        label.textColor = MyColors.tint.color
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progresStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [activityIndicator, percentLabel])
        stack.axis = .horizontal
        stack.spacing = 16
        return stack
    }()
    
    var timer: Timer?
    var percent = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpViews() {
        backgroundColor = .white
        addSubview(mainLogoImage)
        addSubview(loadView)
        loadView.addSubview(progresStack)
    }
    
    private func setUpConstraints() {
        mainLogoImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
        
        loadView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-120)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
            make.height.equalTo(6)
        }
        
        progresStack.snp.makeConstraints { make in
            make.center.equalTo(loadView)
        }
    }
}
