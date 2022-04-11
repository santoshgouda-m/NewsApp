//
//  NewsResponseModel.swift
//  NewsApp
//
//  Created by Santoshgouda M on 11/04/2022.
//

import Foundation

struct TopHeadlinesResponse: Codable {
    var status: String?
    var totalResults:Int?
    var articles: [NewsArticles]?
}

struct NewsArticles: Codable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var source: NewsSource?
}

struct NewsSource: Codable {
    var id: String?
    var name: String?
}
