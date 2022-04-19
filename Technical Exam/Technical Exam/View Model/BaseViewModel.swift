//
//  BaseViewModel.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import Foundation
import RxSwift

class BaseViewModel {

    let loading: PublishSubject<Loading> = PublishSubject()
    let errorDialog: PublishSubject<ErrorDialog> = PublishSubject()
    let cacheManager = CacheManager.sharedInstance
    let networkManager = NetworkManager.sharedInstance
}
