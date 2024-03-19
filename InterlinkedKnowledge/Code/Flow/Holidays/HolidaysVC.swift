//
//  HolidaysVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 20/3/2024.
//

import UIKit

final class HolidaysVC: BaseViewController {

    private var contentView: HolidaysView {
        view as? HolidaysView ?? HolidaysView()
    }
    
    override func loadView() {
        view = HolidaysView()
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }

}

// MARK: - UITableViewDataSource and Delegate methods
extension HolidaysVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .clear
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: headerView.frame.width - 60, height: headerView.frame.height))
        label.text = "Holidays"
        label.font = .customSFProFont(.semibold, size: 20)
        label.textColor = MyColors.black.color
        headerView.addSubview(label)
        
        let addButton = UIButton(type: .custom)
        addButton.frame = CGRect(x: headerView.frame.width - 50, y: 0, width: 50, height: headerView.frame.height)
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(MyColors.tint.color, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        headerView.addSubview(addButton)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 34
    }
    
    @objc func addButtonTapped() {
        print("Add")
    }
}
