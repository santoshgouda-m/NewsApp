//
//  SectionHeaderCell.swift
//  NewsApp
//
//  Created by Santoshgouda M on 09/04/2022.
//

import UIKit

class SectionHeaderCell: UITableViewCell {

    @IBOutlet weak var sectionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(title: String) {
        self.sectionTitle.text = title
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
