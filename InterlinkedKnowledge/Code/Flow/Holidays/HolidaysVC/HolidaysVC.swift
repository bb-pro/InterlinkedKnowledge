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
    
    private var holidays = CoreDataManager.shared.fetchHolidays() {
        didSet {
            contentView.centerLabel.isHidden = !holidays.isEmpty
            contentView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = HolidaysView()
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.centerLabel.isHidden = !holidays.isEmpty
    }

}

// MARK: - UITableViewDataSource and Delegate methods
extension HolidaysVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        holidays.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HolidayCell.id, for: indexPath) as! HolidayCell
        let holiday = holidays[indexPath.row]
        cell.configure(with: holiday)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addHolidayVC = HolidayInfoVC()
//        addHolidayVC.delegate = self
        addHolidayVC.holiday = holidays[indexPath.row]
        present(addHolidayVC, animated: true)
    }
    
    @objc func addButtonTapped() {
        let addHolidayVC = AddHolidayVC()
        addHolidayVC.delegate = self
        present(addHolidayVC, animated: true)
    }
}

// MARK: - DismissDelegate

extension HolidaysVC: DismissDelegate {
    
    func dismiss() {
        holidays = CoreDataManager.shared.fetchHolidays()
    }
}
