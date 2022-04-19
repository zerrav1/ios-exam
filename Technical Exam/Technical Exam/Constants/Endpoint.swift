//
//  Endpoint.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import Foundation

struct Endpoint {
    
    #if DEBUG
        static let baseURL = "https://randomuser.me/"
    #else
        static let baseURL = "https://randomuser.me/"
    #endif
    
    static let apiURL = "api/"
    static let users = baseURL + apiURL +
        "?inc=name,dob,email,phone,cell,location&results=10"
}
