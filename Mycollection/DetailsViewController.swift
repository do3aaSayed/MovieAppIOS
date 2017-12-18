//
//  DetailsViewController.swift
//  Mycollection
//
//  Created by Doaa on 11/1/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedMovie : movie!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieRating: UILabel!
    
    @IBOutlet weak var movieReviewsTableView: UITableView!
    
    var reviews : [review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = getImageURL()
        movieImage.af_setImage(withURL: URL(string: imageURL)!)
        //print(selectedMovie.title)
        movieName.text = "\(selectedMovie.title!)"
        movieRating.text = String (selectedMovie.rating)
        
        movieReviewsTableView.delegate = self
        movieReviewsTableView.dataSource = self
        
    }
    
    func getImageURL () -> String{
        
        let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = "\(imageBaseUrl)\(selectedMovie.image)"
        return imageUrl
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Review Cell", for: indexPath) as? ReviewsTableViewCell
        
        let review = reviews[indexPath.row]
        
        cell?.updateReviewsTableView(movieReview: review)
        
        return cell!

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
