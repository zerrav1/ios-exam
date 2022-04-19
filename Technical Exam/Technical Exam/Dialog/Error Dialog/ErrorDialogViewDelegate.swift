//
//  ErrorDialogViewDelegate.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import UIKit

protocol ErrorDialogViewDelegate {
    
    func showErrorDialog(errorMessage: String?,
                         okCallback: (() -> Void)?)
}

extension ErrorDialogViewDelegate where Self: UIViewController {
    
    func showErrorDialog(errorMessage: String?,
                         okCallback: (() -> Void)?) {
        
        let vc = ErrorDialogViewController.loadFromNib()
        
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        
        vc.errorMessage = errorMessage
        vc.okCallback = {
            okCallback?()
        }
        
        present(vc, animated: true, completion: nil)
    }
}
