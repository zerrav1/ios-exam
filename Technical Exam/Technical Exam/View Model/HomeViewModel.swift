//
//  HomeViewModel.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import Foundation
import RxSwift

class HomeViewModel: BaseViewModel {
    
    let users: PublishSubject<[Users.Results]> = PublishSubject()
    
    
    func getUsers() {
        
        loading.onNext(.present(nil))
        
        if let users = cacheManager.users {
            self.loading.onNext(.dismiss(nil))
            self.users.onNext(users)
        }
        else {      
            networkManager.getUsers { result in

                self.loading.onNext(.dismiss(nil))

                switch result {
                case .onSuccess(let users):
                    guard let userResult = users.results else {
                        self.users.onNext([])
                        return
                    }
                    self.cacheManager.users = userResult
                    self.users.onNext(userResult)
                    break
                case .onFailed(let errorMessage):
                    self.errorDialog.onNext(
                        ErrorDialog(errorMessage: errorMessage,
                                    okCallback: nil))
                    break
                }
            }
        }
    }
    
    func removeCache() {
        self.cacheManager.removeObject(key: Key.users)
    }
}
