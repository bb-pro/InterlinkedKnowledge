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
        contentView.editButton.actionButton.addTarget(self, action: #selector(currencyPressed), for: .touchUpInside)
        
        contentView.decoratingTF.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.drinksTF.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.giftTF.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.mealTF.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        contentView.rentTF.field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        updateUI()
    }
    
    func updateUI() {
        if contentView.segmentedControl.selectedSegmentIndex == 1 {
            if CoreDataManager.shared.fetchHolidayCosts().isEmpty {
                contentView.centerLabel.isHidden = false
                contentView.tableView.isHidden = true
            } else {
                contentView.centerLabel.isHidden = true
                contentView.tableView.isHidden = false
            }
        } else {
            contentView.tableView.isHidden = true
            contentView.centerLabel.isHidden = true
        }
        print(CoreDataManager.shared.fetchHolidayCosts())
        contentView.tableView.reloadData()
    }
    
    // MARK: - Actions
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let isValidInt = { (text: String?) -> Bool in
            if let text = text, let _ = Int(text) {
                return true
            } else {
                return false
            }
        }
        
        let isValidInput = isValidInt(contentView.decoratingTF.field.text) ||
        isValidInt(contentView.drinksTF.field.text) ||
        isValidInt(contentView.giftTF.field.text) ||
        isValidInt(contentView.mealTF.field.text) ||
        isValidInt(contentView.rentTF.field.text)
        
        contentView.calculateBtn.actionButton.isEnabled = isValidInput
    }
    
    
    
    @objc func currencyPressed() {
        let currencyListVC = CurrencyListVC()
        currencyListVC.delegate = self
        present(currencyListVC, animated: true)
    }
    
    @objc func segmentAction() {
        contentView.textfieldStack.isHidden = contentView.segmentedControl.selectedSegmentIndex == 1
        //        contentView.tableView.isHidden = contentView.segmentedControl.selectedSegmentIndex == 0
        updateUI()
    }
    
    @objc func calculatePressed() {
        let drinksCost = Int(contentView.drinksTF.field.text ?? "0") ?? 0
        let giftCost = Int(contentView.giftTF.field.text ?? "0") ?? 0
        let mealCost = Int(contentView.mealTF.field.text ?? "0") ?? 0
        let rentCost = Int(contentView.rentTF.field.text ?? "0") ?? 0
        
        let name = contentView.nameTFView.field.text ?? ""
        
        let totalCost = drinksCost + giftCost + mealCost + rentCost
        
        let resultVC = CalculationResultVC()
        resultVC.name = name
        resultVC.cost = Int32(totalCost)
        resultVC.delegate = self
        present(resultVC, animated: true)
        
    }
    
}

// MARK: - ResultVCDelegate

extension CalculationsVC: CalculationResultVCDelegate {
    func savePressed() {
        updateUI()
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
