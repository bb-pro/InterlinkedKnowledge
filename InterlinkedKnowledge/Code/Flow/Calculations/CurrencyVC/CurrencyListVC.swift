//
//  CurrencyListVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 26/3/2024.
//

import UIKit

protocol CurrencyListVCDelegate: AnyObject {
    func selectedCurrency(name: String)
}

final class CurrencyListVC: BaseViewController {
    
    weak var delegate: CurrencyListVCDelegate?
    
    private var contentView: CurrencyListView {
        view as? CurrencyListView ?? CurrencyListView()
    }

    private var currencies: [CurrencyResult] = []
    
    override func loadView() {
        view = CurrencyListView()
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        fetchData()
    }
    
    private func fetchData() {
        let manager = NetworkManager.shared
        manager.getCurrencyRatio { [self] result in
            switch result {
            case .success(let success):
                print(success)
                currencies = success
                DispatchQueue.main.async {
                    self.contentView.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }

}

// MARK: - UITableView DataSource and Delegate methods

extension CurrencyListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        cell.configure(wtih: currencies[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currency = currencies[indexPath.row]
        let infoVC = CurrencyInfoVC()
        infoVC.currency = currency
        infoVC.delegate = self
        present(infoVC, animated: true)
    }
    
}

// MARK: - CurrencyInfoVCDelegate

extension CurrencyListVC: CurrencyInfoVCDelegate {
    func selectedCurrencyItem(name: String) {
        delegate?.selectedCurrency(name: name)
    }
}
