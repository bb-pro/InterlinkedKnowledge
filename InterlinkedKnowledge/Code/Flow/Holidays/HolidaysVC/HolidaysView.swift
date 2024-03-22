//
//  HolidaysView.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit
import SnapKit

final class HolidaysView: UIView {
    
    private(set) lazy var totalAmountView: TotalInfoView = {
        let view = TotalInfoView()
        view.configure(with: TotalData(iconName: "dollarSign", title: "Total amount", total: "$0"))
        return view
    }()
    
    private(set) lazy var totalHolidaysView: TotalInfoView = {
        let view = TotalInfoView()
        view.configure(with: TotalData(iconName: "giftSign", title: "Quantity Holidays", total: "0"))
        return view
    }()
    
    private lazy var topStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [totalAmountView, totalHolidaysView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private(set) lazy var editButton: CustomButtonView = {
        let btn = CustomButtonView()
        btn.btnUpdate(item: ButtonDM(
            icon: "",
            title: "Edit",
            textColor: MyColors.white.color,
            backColor: MyColors.tint.color))
        return btn
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private(set) lazy var centerLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .customSFFont(.regular, size: 17)
        lbl.textColor = MyColors.secondaryText.color
        lbl.text = "There are no scheduled\nholidays for this day"
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
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
        addSubview(topStack)
        addSubview(editButton)
        addSubview(tableView)
        addSubview(centerLabel)
    }
    
    private func setUpConstraints() {
        
        topStack.snp.makeConstraints { make in
            make.height.equalTo(117)
            make.top.equalToSuperview().offset(84)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        centerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        editButton.snp.makeConstraints { make in
            make.top.equalTo(topStack.snp.bottom).offset(10)
            make.height.equalTo(45)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(editButton.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}

