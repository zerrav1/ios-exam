//
//  Reactive+Extensions.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import UIKit
import RxSwift
import RxCocoa

extension UIViewController: LoadingViewDelegate, ErrorDialogViewDelegate {}

extension Reactive where Base: BaseViewController {
    
    internal var showLoading: Binder<Loading> {
        
        return Binder(self.base, binding: { (vc, loading) in
            
            switch loading {
                
            case .present(let message):
                vc.presentLoading(message: message)
                break
                
            case .dismiss(let callback):
                vc.dismissLoading(completion: callback)
                break
                
            }
        })
    }
    
    internal var errorDialog: Binder<ErrorDialog> {
        
        return Binder(self.base, binding: { (vc, errorDialog) in
            
            vc.showErrorDialog(
                errorMessage: errorDialog.errorMessage,
                okCallback: errorDialog.okCallback)
        })
    }
}

enum Loading {
    
    case present(String?)
    case dismiss((() -> Void)?)
}

struct ErrorDialog {
    
    let errorMessage: String?
    let okCallback: (() -> Void)?
}

