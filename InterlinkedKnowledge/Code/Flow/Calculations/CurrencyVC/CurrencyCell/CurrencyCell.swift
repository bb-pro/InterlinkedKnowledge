//
//  CurrencyCell.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import UIKit

final class CurrencyCell: UITableViewCell {
    
    static let id = String(describing: CurrencyCell.self)
    
    // MARK: - Elements
    
    private(set) lazy var backgroundContentView: UIView = {
        let view = UIView()
        view.backgroundColor = MyColors.bgSecond.color
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(currencyView)
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var currencyView: CurrencyPairView = {
        let currencyView = CurrencyPairView()
//        currencyView.configure(with: CurrencyPair(image: "", name: "", amount: "", profit: "", isRightHidden: true))
        return currencyView
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
        addSubview(backgroundContentView)
    }
    
    func configure(wtih data: CurrencyResult) {
        let amount = data.resultBuyItem
        let profit = data.resultSellItem - data.resultBuyItem
        let profitString = profit > 0 ? "$+\(profit)" : "$\(profit)"
        currencyView.configure(with: CurrencyPair(image: data.resultCurrencyItem, name: data.resultCurrencyItem.dividedBySlash(), amount: "$\(amount)", profit: profitString, isRightHidden: true))
    }
    
    func setUpConstraints() {
        
        currencyView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundContentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(94)
        }
    }
}
