//
//  HolidayCell.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

final class HolidayCell: UITableViewCell {
    
    static let id = String(describing: HolidayCell.self)
    
    // MARK: - Элементы
    private(set) lazy var backgroundContentView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFProFont(.semibold, size: 17)
        lbl.textColor = .black
        return lbl
    }()
    
    private lazy var dateLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFFont(.regular, size: 12)
        lbl.textColor = MyColors.secondaryText.color
        lbl.numberOfLines = 0
        lbl.snp.makeConstraints { make in
            make.width.equalTo(67)
        }
        return lbl
    }()
    
    private lazy var presentImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = .present
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
    }
    
    func setUpConstraints() {
        
    }
    
}
