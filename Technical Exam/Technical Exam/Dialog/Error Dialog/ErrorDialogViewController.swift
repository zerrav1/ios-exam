//
//  ErrorDialogViewController.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import UIKit

class ErrorDialogViewController: UIViewController {
    
    @IBOutlet weak var errorMessageLabel: UILabel!
    var errorMessage: String?
    var okCallback: (() ->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessage()
    }
    
    func setupMessage() {
        errorMessageLabel.text = errorMessage ?? ""
    }
    
    @IBAction func okButtonPressed(_ sender: Any) {
        dismiss(animated: true) {
            self.okCallback?()
        }
    }
}
