//
//  ViewController.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {
    
    let homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupView()
    }
}

extension HomeViewController {
    
    func setupView() {
        homeViewModel.getUsers()
    }
    
    func setupBindings() {
        
        homeViewModel.loading
            .bind(to: self.rx.showLoading)
            .disposed(by: disposeBag)
        
        homeViewModel.errorDialog
            .bind(to: self.rx.errorDialog)
            .disposed(by: disposeBag)
        
        homeViewModel.users
            .bind(to: tableView.rx.items(
                cellIdentifier: Storyboard.usersCell,
                cellType: UsersTableViewCell.self)) {
                    row, item, cell in

            if let name = item.name {
                cell.setDetails(name: name)
            }
        }.disposed(by: disposeBag)
    
        tableView.rx.itemSelected
            .subscribe(onNext: { indexPath in
                
            guard let user = try? self.tableView.rx
                .model(at: indexPath)
                    as Users.Results? else { return }
            self.performSegue(withIdentifier: Segue.homeToUserDetails,
                              sender: user)
        }).disposed(by: disposeBag)
    }
}

extension HomeViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.homeToUserDetails {
            let userDetails = sender as? Users.Results
            let destinationVC = segue.destination
                as? UserDetailsViewController
            
            destinationVC?.userDetailsViewModel
                .userDetails = userDetails
        }
    }
}

