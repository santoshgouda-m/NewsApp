//
//  PopularNewsCell.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import UIKit

class PopularNewsCell: UITableViewCell {

    @IBOutlet weak var popularNewsTitleLabel: UILabel!
    @IBOutlet weak var popularNewsImage: UIImageView!
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
        self.popularNewsTitleLabel.text = newsArticle.title
        self.popularNewsImage.loadImagesUsingURL(urlString: newsArticle.urlToImage ?? "")
        self.newsSourceLabel.text = newsArticle.source?.name
        self.newsDescriptionLabel.text = newsArticle.description
        self.newsSourceLabel.layer.cornerRadius = self.newsSourceLabel.frame.size.height / 2.5
        self.newsSourceLabel.clipsToBounds = true
    }
}
