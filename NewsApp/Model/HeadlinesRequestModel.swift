//
//  HeadlinesRequestModel.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class TopHeadLinesRequestModel:RequestModel{
     var page:Int
    
     init(page:Int) {
         self.page = page
         
     }
     override var headers: [String : String]{
         return ["Authorization":"\(Constants.APIKey)"]
     }
     override var path: String{
        return Constants.API.topHeadlines(page: page).getRawValue()
     }
}
