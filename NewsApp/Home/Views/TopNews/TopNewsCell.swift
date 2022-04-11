//
//  TopNewsCell.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import UIKit

class TopNewsCell: UITableViewCell {

    @IBOutlet weak var topNewsTitleLabel: UILabel!
    @IBOutlet weak var topNewsImage: UIImageView!
    @IBOutlet weak var newsSourceLabel: UILabel!
    @IBOutlet weak var newsDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(newsArticle: NewsArticles) {
        self.topNewsTitleLabel.text = newsArticle.title
        self.topNewsImage.loadImagesUsingURL(urlString: newsArticle.urlToImage ?? "")
        self.newsSourceLabel.text = newsArticle.source?.name
        self.newsDescriptionLabel.text = newsArticle.description
        self.newsSourceLabel.layer.cornerRadius = self.newsSourceLabel.frame.size.height / 2.5
        self.newsSourceLabel.clipsToBounds = true
    }
    
}

