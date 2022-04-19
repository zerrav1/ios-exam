//
//  UserDetailsViewController.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import UIKit
import RxSwift
import RxCocoa

class UserDetailsViewController: BaseViewController {
 
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    let userDetailsViewModel = UserDetailsViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupView()
    }
}

extension UserDetailsViewController {
    
    func setupBindings() {
        
        userDetailsViewModel.loading
            .bind(to: self.rx.showLoading)
            .disposed(by: disposeBag)
    }
    
    func setupView() {
        firstNameLabel.text = userDetailsViewModel.userDetails.name?.first
        lastNameLabel.text = userDetailsViewModel.userDetails.name?.last
        birthdayLabel.text = userDetailsViewModel.getFormattedBirthday()
        ageLabel.text = "\(userDetailsViewModel.userDetails.dob?.age ?? 0)"
        emailLabel.text = userDetailsViewModel.userDetails.email ?? ""
        mobileNumberLabel.text = userDetailsViewModel.userDetails.phone
        addressLabel.text = userDetailsViewModel.getFormattedAddress()
    }
}
