//
//  DataManager.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class DataManager {
    
//    class func getPhotos(search: String,pageNum:Int, completion: @escaping(Swift.Result<PhotosResponseModel, ErrorModel>)->Void) {
//        ServiceManager.shared.sendRequest(request: PhotosRequestModel(search: search, pageNo: pageNum)) { (result) in
//            completion(result)
//        }
//    }
    
    class func loadNews(page: Int, completion: @escaping(Swift.Result<TopHeadlinesResponse, ErrorModel>)->Void) {
        ServiceManager.shared.sendRequest(request: TopHeadLinesRequestModel(page: page)) { (result) in
            completion(result)
        }
    }
}
