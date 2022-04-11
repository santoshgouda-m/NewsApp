//
//  HomeCoordinator.swift
//  NewsApp
//
//  Created by Santoshgouda M on 09/04/2022.
//

import Foundation
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController:UINavigationController?
    
      init(navController:UINavigationController?) {
        super.init(parent: nil)
        self.navigationController = navController
        
        addEventHandlers()
    }
    
    func createFlow(){
        
        let controller = UIStoryboard.getMainStoryBoard().instantiateViewController(forClass: HomeViewController.self)
        let viewModel = HomeViewModel(coordinator: self)
        controller.viewModel = viewModel
        self.navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    func addEventHandlers() {
        addHandler { [weak self] (event:HomeEvent) in
            switch event {
            case .showDetailScreen(let detailObject, let popularArticles):
                self?.showDetailScreen(deatilObject: detailObject ?? NewsArticles(), popularArticles: popularArticles ?? [NewsArticles]())
            }
        }
    }
    
    func showDetailScreen(deatilObject: NewsArticles, popularArticles: [NewsArticles]) {
        let controller = UIStoryboard.getMainStoryBoard().instantiateViewController(forClass: NewsDetailViewController.self)
        let viewModel = NewsDeatilViewModel(newsDetailsObject: deatilObject, popularNewsDataSource: popularArticles, coordinator: self)
        controller.viewModel = viewModel
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

enum HomeEvent: Event {
    case showDetailScreen(detailObject: NewsArticles?, popularArticles: [NewsArticles]?)
}
