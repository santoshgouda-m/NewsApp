//
//  ServiceManager.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class ServiceManager {
    
    public static let shared: ServiceManager = ServiceManager()
    
    public var baseURL: String = "https://newsapi.org"
}

extension ServiceManager {
    
    func sendRequest<T: Codable>(request: RequestModel, completion: @escaping(Swift.Result<T, ErrorModel>) -> Void) {

   
    let session =  URLSession.shared.dataTask(with: request.urlRequest(), completionHandler: { data, response, error in
        guard let data = data,let responseModel = try? JSONDecoder().decode(T.self, from: data) else {
                let error: ErrorModel = ErrorModel(ErrorKey.parsing.rawValue)
               print("error")

                completion(Result.failure(error))
                return
                
            }

      
            completion(Result.success(responseModel))
     

            
            })
        session.resume()

    }
}
