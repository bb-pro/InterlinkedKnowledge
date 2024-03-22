//
//  HolidayInfoVC.swift
//  InterlinkedKnowledge
//
//  Created by Bektemur Mamashayev on 22/3/2024.
//

import UIKit

final class HolidayInfoVC: ModalVC, DismissDelegate {

    private var contentView: HolidayInfoView {
        view as? HolidayInfoView ?? HolidayInfoView()
    }
    
    weak var delegate: DismissDelegate?
    
    var holiday: Holiday!
    
    override func loadView() {
        view = HolidayInfoView()
        contentView.editButton.addTarget(self, action: #selector(editPressed), for: .touchUpInside)
        contentView.deleteButton.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)
        contentView.updateUI(with: holiday)
    }
    
    // MARK: - Actions
    
    func dismiss() {
        delegate?.dismiss()
        dismissAllPresentedViewControllers()
    }
    
    @objc func editPressed() {
        let addHolidayVC = AddHolidayVC()
        addHolidayVC.holiday = holiday
        addHolidayVC.delegate = self
        present(addHolidayVC, animated: true)
    }
    @objc func deletePressed() {
        let alertController = UIAlertController(title: "Deletion", message: "Do you really you want to delete it?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
                self?.deleteHoliday()
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(deleteAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
        private func deleteHoliday() {
            CoreDataManager.shared.deleteHoliday(holiday)
            dismissAllPresentedViewControllers()
            delegate?.dismiss()
        }
}
