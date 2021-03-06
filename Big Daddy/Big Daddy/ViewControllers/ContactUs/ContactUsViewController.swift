//
//  ContactUsViewController.swift
//  Big Dady
//
//  Created by Dhruvik Dhanani on 10/03/21.
//

import UIKit

class ContactUsViewController: UIViewController {

    @IBOutlet weak var topOfTitleLabel: NSLayoutConstraint!
    var notificationBlock:(()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func btnNotificationAction(_ sender: UIButton) {
        dismiss(animated: true) { [weak self] in
            guard let notify = self?.notificationBlock else { return }
            notify()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.topOfTitleLabel.constant = 8
            self?.view.layoutIfNeeded()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = true
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.topOfTitleLabel.constant = 64
            self?.view.layoutIfNeeded()
        }
    }
}
