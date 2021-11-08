//
//  SearchTableViewCell.swift
//  MovieReviewAppwithSwift
//
//  Created by Halil İbrahim Öztekin on 8.11.2021.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var linkLabel: UILabel!
    @IBOutlet var descLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
