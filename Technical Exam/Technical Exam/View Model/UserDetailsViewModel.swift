//
//  UserDetailsViewModel.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//

import Foundation

class UserDetailsViewModel: BaseViewModel {
    
    var userDetails: Users.Results!
    
    func getFormattedBirthday() -> String {
        let dateFormatter = DateFormatter()
    
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let date = dateFormatter.date(from: userDetails.dob?.date ?? "")
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: date ?? Date())
    }
    
    func getFormattedAddress() -> String {
        let streetNumber = userDetails.location?.street?.number ?? 0
        let streetName = userDetails.location?.street?.name ?? ""
        let city = userDetails.location?.city ?? ""
        let state = userDetails.location?.state ?? ""
        let country = userDetails.location?.city ?? ""
        let postcode = userDetails.location?.postcode ?? ""
        
        return "\(streetNumber) \(streetName), \(city), \(state), \(country) \(postcode)"
    }
}
