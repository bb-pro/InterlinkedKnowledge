//
//  CalculationsVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 23/3/2024.
//

import UIKit

final class CalculationsVC: BaseViewController {
    
    private var contentView: CalculationsView {
        view as? CalculationsView ?? CalculationsView()
    }
    
    override func loadView() {
        view = CalculationsView()
        contentView.calculateBtn.actionButton(target: self, action: #selector(calculatePressed))
        contentView.segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        contentView.currencyView.actionButton.addTarget(self, action: #selector(currencyPressed), for: .touchUpInside)
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
    
    // MARK: - Actions
    
    @objc func currencyPressed() {
        let currencyListVC = CurrencyListVC()
        currencyListVC.delegate = self
        present(currencyListVC, animated: true)
    }
    
    @objc func segmentAction() {
        contentView.textfieldStack.isHidden = contentView.segmentedControl.selectedSegmentIndex == 1
    }
    
    @objc func calculatePressed() {
        let resultVC = CalculationResultVC()
        present(resultVC, animated: true)
    }
}

// MARK: - CurrencyListDelegate

extension CalculationsVC: CurrencyListVCDelegate {
    func selectedCurrency(name: String) {
        contentView.currencyView.configure(with: CurrencyPair(
            image: name,
            name: name.dividedBySlash(),
            amount: "",
            profit: "",
            isRightHidden: false))
    }
}

// MARK: - UITableView DataSource and Delegate methods

extension CalculationsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataManager.shared.fetchHolidayCosts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HolidayCostCell", for: indexPath) as! HolidayCostCell
        let holidays = CoreDataManager.shared.fetchHolidayCosts()
        cell.configure(with: holidays[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}
