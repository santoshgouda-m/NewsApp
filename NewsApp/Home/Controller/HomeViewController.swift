//
//  ViewController.swift
//  NewsApp
//
//  Created by Santoshgouda M on 09/04/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    lazy var activityIndicator: UIActivityIndicatorView? = nil
    
    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        initializeUI()
        viewModel.loadTopNews(pageNum: 1)
        // Do any additional setup after loading the view.
    }
    
    func registerCells() {
        newsTableView.register(UINib(nibName: TableViewIdentifiers.homeHeader.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.homeHeader.rawValue)
        newsTableView.register(UINib(nibName: TableViewIdentifiers.sectionHeader.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.sectionHeader.rawValue)
        newsTableView.register(UINib(nibName: TableViewIdentifiers.topNews.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.topNews.rawValue)
        newsTableView.register(UINib(nibName: TableViewIdentifiers.popularNews.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.popularNews.rawValue)
        newsTableView.register(UINib(nibName: TableViewIdentifiers.homeFooter.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.homeFooter.rawValue)
    }
    
    func initializeUI() {
        newsTableView.dataSource = self
        newsTableView.delegate = self
        viewModel.outputDelegate = self
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.dataSource[section] {
        case .homeHeader, .topNews:
            return 1
        case .popularNews:
            return viewModel.popularNewsDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.dataSource[indexPath.section] {
        case .homeHeader:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.homeHeader.rawValue, for: indexPath) as? HomeHeaderCell else { return UITableViewCell() }
            return cell
        case .topNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.topNews.rawValue, for: indexPath) as? TopNewsCell else { return UITableViewCell() }
            cell.updateUI(newsArticle: viewModel.topNewsArticle)
            return cell
        case .popularNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.popularNews.rawValue, for: indexPath) as? PopularNewsCell else { return UITableViewCell() }
            cell.updateUI(newsArticle: viewModel.popularNewsDataSource[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.dataSource[indexPath.section] {
        case .topNews:
            self.viewModel.coordinator?.raise(event: HomeEvent.showDetailScreen(detailObject: viewModel.topNewsArticle, popularArticles: viewModel.popularNewsDataSource))
        case .homeHeader:
            return
        case .popularNews:
            self.viewModel.coordinator?.raise(event: HomeEvent.showDetailScreen(detailObject: viewModel.popularNewsDataSource[indexPath.row], popularArticles: viewModel.sendPopularNewsData(index: indexPath.row)))
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch viewModel.dataSource[section] {
        case .topNews, .popularNews:
            return 50.0
        default:
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch viewModel.dataSource[section] {
        case .topNews, .popularNews:
            guard let headerCell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.sectionHeader.rawValue) as? SectionHeaderCell else { return UIView() }
            headerCell.updateUI(title: viewModel.dataSource[section].rawValue)
            return headerCell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch viewModel.dataSource[section] {
        case .popularNews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.homeFooter.rawValue) as? HomeFooterCell else { return UITableViewCell() }
            cell.updateUI(shouldShowLoadingView: viewModel.hasMoreNewsToLoad())
            return cell
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch viewModel.dataSource[section] {
        case .popularNews:
            let height = viewModel.hasMoreNewsToLoad() ? 170.0 : 110.0
            return height
        default:
            return 0.0
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y + scrollView.frame.size.height + 1) >= scrollView.contentSize.height {
            if viewModel.hasMoreNewsToLoad() {
                viewModel.loadMoreNews()
            }
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.newsTableView.reloadData()
        }
    }
    
    func updateUIAfterLoading() {
        DispatchQueue.main.async {
            if let indicator = self.activityIndicator {
                CustomActivityIndicator.removeActivityIndicator(activityIndicator: indicator)
            }
            self.view.isUserInteractionEnabled = true
        }
    }
    
    func updateUIBeforeLoading() {
        DispatchQueue.main.async {
            self.activityIndicator = CustomActivityIndicator.showActivityIndicator(inView: self.view)
            self.activityIndicator?.startAnimating()
            self.view.isUserInteractionEnabled = false
        }
    }
}
