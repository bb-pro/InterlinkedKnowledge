//
//  HolidayCostCell.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 25/3/2024.
//

import UIKit

final class HolidayCostCell: UITableViewCell {
    
    static let id = String(describing: HolidayCostCell.self)
    
    // MARK: - Elements
    
    private(set) lazy var backgroundContentView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(costLabel)
        view.addSubview(costImgView)
        
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var costImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .holidayCost
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 17)
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var costLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 22)
        lbl.textColor = .black
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with data: HolidayCost) {
        titleLabel.text = data.name
        costLabel.text = "$\(data.cost)"
    }
    
    private func setUpViews() {
        addSubview(backgroundContentView)
    }
    
    
    private func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-16)
        }
        
        costImgView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.height.width.equalTo(57)
        }
        
        costLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(80)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
}
