//
//  LoadingViewController.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMessage()
    }
    
    private func setupMessage() {
        guard let message = message else {
            messageLabel.isHidden = true
            return
        }
        
        messageLabel.text = message
    }
}
