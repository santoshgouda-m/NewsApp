//
//  Constants.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

class Constants {
    static let APIKey: String = "30e9757e00334000b1e59425b039f2a4"
    
    enum API{
        case topHeadlines(page:Int)
        
        func getRawValue()->String{
            switch self {
            case .topHeadlines(let page):
                var rawValue =  BaseAPI.topHeadlines.rawValue
                if(page > 0){
                    rawValue = rawValue + "?country=in&pageSize=10&page=\(page)"
                }
                return rawValue
            }
        }
    }
    
    enum BaseAPI:String{
        case topHeadlines = "/v2/top-headlines"
    }
    
}

enum TableViewIdentifiers: String {
    case homeHeader =  "HomeHeaderCell"
    case sectionHeader = "SectionHeaderCell"
    case topNews = "TopNewsCell"
    case popularNews = "PopularNewsCell"
    case homeFooter = "HomeFooterCell"
}
