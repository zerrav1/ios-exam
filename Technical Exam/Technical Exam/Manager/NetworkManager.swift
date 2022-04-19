//
//  NetworkManager.swift
//  Technical Exam
//
//  Created by Yves Edward Andigan on 4/19/22.
//  
//

import Foundation
import Alamofire

enum HTTPResult<T> {
    
    case onSuccess(T)
    case onFailed(String)
}

class NetworkManager {
    
    typealias NetworkResult<T> = ((HTTPResult<T>) -> Void)
    
    let jsonDecoder = JSONDecoder()
    static let sharedInstance = NetworkManager()
    
    func request(url: String,
                 method: Alamofire.HTTPMethod,
                 parameters: Parameters?,
                 headers: HTTPHeaders?,
                 completionHandler: @escaping (_ jsonData:Data?,
                                               _ success:Bool,
                                               _ errorMessage:String?,
                                               _ statusCode:Int?) -> Void) {
          
        AF.request(url, method: method, parameters: parameters,
             headers: headers).responseData { response in
                  
            let statusCode = response.response?.statusCode
                  
            switch response.result {

            case let .success(value):
              let data = value
              
              #if DEBUG
                  do {
                      let json = try JSONSerialization
                          .jsonObject(with: data, options: [])
                      print("JSON \(json)")
                  }
                  catch { }
              #endif
              
              completionHandler(data,true,nil,statusCode!)
              
              break
            case let .failure(errorMessage):
                completionHandler(nil,
                                  false,
                                  errorMessage.errorDescription,
                                  statusCode)
                break
            }
        }
    }
    
    func getUsers(completion: @escaping NetworkResult<Users>) {

        request(url: Endpoint.users,
                method: .get,
                parameters: nil,
                headers: nil) { data, isSucess, errorMessage, statusCode in

            if isSucess {
                do {
                    let users = try self.jsonDecoder
                        .decode(Users.self, from: data!)
                    completion(.onSuccess(users))
                }
                catch {
                    print(error)
                    completion(.onFailed(errorMessage ??
                        Constants.genericErrorMessage))
                }

            }
            else {
                completion(.onFailed(errorMessage ??
                    Constants.genericErrorMessage))
            }
        }
    }
}
