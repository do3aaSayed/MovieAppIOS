//
//  ReviewsTableViewCell.swift
//  Mycollection
//
//  Created by Doaa on 12/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import UIKit

class ReviewsTableViewCell : UITableViewCell {
    
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateReviewsTableView(movieReview : review) {
        
        authorNameLabel.text = movieReview.authorName
        reviewLabel.text = movieReview.authorReview
        
    }
    
}
