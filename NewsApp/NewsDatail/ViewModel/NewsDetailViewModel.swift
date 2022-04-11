//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by Santoshgouda M on 11/04/2022.
//

import Foundation

class NewsDeatilViewModel: BaseViewModel {
    
    var newsDetailsObject: NewsArticles?
    var popularNewsDataSource: [NewsArticles]?
    
    init(newsDetailsObject: NewsArticles, popularNewsDataSource: [NewsArticles], coordinator: Coordinator) {
        self.newsDetailsObject = newsDetailsObject
        self.popularNewsDataSource = popularNewsDataSource
        super.init(coordinator: coordinator)
    }
}
