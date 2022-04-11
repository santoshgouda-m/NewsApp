//
//  HomeFooterCell.swift
//  NewsApp
//
//  Created by Santoshgouda M on 10/04/2022.
//

import UIKit

class HomeFooterCell: UITableViewCell {

    @IBOutlet weak var loadingView: UIView!
    
    @IBOutlet weak var loadingViewHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(shouldShowLoadingView: Bool) {
        self.loadingView.isHidden = !shouldShowLoadingView
        self.loadingViewHeight.constant = shouldShowLoadingView ? 50.0 : 0.0
    }
    
}
