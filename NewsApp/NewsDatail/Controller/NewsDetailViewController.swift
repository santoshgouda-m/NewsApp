//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import UIKit
import WebKit

class NewsDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var detailWebView: WKWebView!
    
    var viewModel: NewsDeatilViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupUI()
        loadUrlInWebView()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupUI() {
        titleLabel.text = viewModel.newsDetailsObject?.url
        newsTableView.dataSource = self
        newsTableView.delegate = self
    }
    
    func registerCells() {
        newsTableView.register(UINib(nibName: TableViewIdentifiers.sectionHeader.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.sectionHeader.rawValue)
        newsTableView.register(UINib(nibName: TableViewIdentifiers.popularNews.rawValue, bundle: nil), forCellReuseIdentifier: TableViewIdentifiers.popularNews.rawValue)
    }

    func loadUrlInWebView() {
        guard let url = URL(string: viewModel.newsDetailsObject?.url ?? "") else { return }
        let request = URLRequest(url: url)
        detailWebView.load(request)
    }
}

extension NewsDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.popularNews.rawValue, for: indexPath) as? PopularNewsCell else { return UITableViewCell() }
        cell.updateUI(newsArticle: viewModel.popularNewsDataSource?[indexPath.row] ?? NewsArticles())
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerCell = tableView.dequeueReusableCell(withIdentifier: TableViewIdentifiers.sectionHeader.rawValue) as? SectionHeaderCell else { return UIView() }
        headerCell.updateUI(title: HomeDataSourceTypes.popularNews.rawValue)
        return headerCell
        
    }
}



