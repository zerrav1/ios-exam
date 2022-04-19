//
//  CacheManager.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import Foundation
import SecureDefaults

class CacheManager {
    
    let defaults = SecureDefaults()
    static let sharedInstance = CacheManager()
    
    init() {
        if !defaults.isKeyCreated {
            defaults.password = UUID().uuidString
        }
    }
    
    func removeObject(key: String) {
        self.defaults.removeObject(forKey: key)
    }
    
    var users: [Users.Results]? {
        get {
            let jsonDecoder = JSONDecoder()
            do {
                if let data = self.defaults
                    .object(forKey: Key.users) as? Data {
                    let users = try jsonDecoder
                        .decode([Users.Results].self, from: data)
                    return users
                }
            }
            catch { }
            return nil
        }
        set(newValue) {
            let jsonEncoder = JSONEncoder()
            do {
                let data = try jsonEncoder.encode(newValue)
                self.defaults.set(data, forKey: Key.users)
            }
            catch { }
        }
    }
}
