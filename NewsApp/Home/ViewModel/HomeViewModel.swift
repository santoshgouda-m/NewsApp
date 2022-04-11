//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import Foundation

enum HomeDataSourceTypes: String {
    case homeHeader
    case topNews = "Top News"
    case popularNews = "Popular News"
}

protocol HomeViewModelDelegate {
    func reloadTableView()
    func updateUIBeforeLoading()
    func updateUIAfterLoading()
}


class HomeViewModel: BaseViewModel {
    var dataSource: [HomeDataSourceTypes] = [.homeHeader]
    var popularNewsDataSource = [NewsArticles]()
    var topNewsArticle = NewsArticles()
    var topNewsResponse: TopHeadlinesResponse?
    var outputDelegate: HomeViewModelDelegate?
    var pageNum = 1
    
    func initializeDataSource() {
        dataSource = [.homeHeader, .topNews, .popularNews]
        self.popularNewsDataSource.append(contentsOf: (topNewsResponse?.articles ?? [NewsArticles]()))
        if pageNum == 1 {
            self.topNewsArticle = self.popularNewsDataSource.removeFirst()
        }
    }
    
    func loadTopNews(pageNum: Int) {
        self.outputDelegate?.updateUIBeforeLoading()
        DataManager.loadNews(page: pageNum) { data in
            switch data {
            case .success(let response):
                print(pageNum)
                print(response)
                self.outputDelegate?.updateUIAfterLoading()
                self.topNewsResponse = response
                self.initializeDataSource()
                self.outputDelegate?.reloadTableView()
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func loadMoreNews() {
        pageNum += 1
        loadTopNews(pageNum: pageNum)
    }
    
    func hasMoreNewsToLoad() -> Bool {
        return (topNewsResponse?.totalResults ?? 0) - 1 > popularNewsDataSource.count
    }
}
