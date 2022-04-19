//
//  LoadingViewDelegate.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import UIKit

protocol LoadingViewDelegate {
    
    func presentLoading(message: String?)
    func dismissLoading(completion: (() -> Void)?)
    
}

extension LoadingViewDelegate where Self: UIViewController {
    
    func presentLoading(message: String?) {
        
        let vc = LoadingViewController.loadFromNib()

        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.message = message ?? "Loading"
        
        present(vc, animated: true, completion: nil)
    }
    
    func dismissLoading(completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
    
}
