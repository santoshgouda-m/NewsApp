//
//  DataManager.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class DataManager {
    class func loadNews(page: Int, completion: @escaping(Swift.Result<TopHeadlinesResponse, ErrorModel>)->Void) {
        ServiceManager.shared.sendRequest(request: TopHeadLinesRequestModel(page: page)) { (result) in
            completion(result)
        }
    }
}
