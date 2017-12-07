//
//  DetailsViewController.swift
//  Mycollection
//
//  Created by Doaa on 11/1/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController : UIViewController {
    
    var selectedMovie : movie!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieGenre: UITextView!
    
    @IBOutlet weak var movieReleaseYear: UITextView!
    
    @IBOutlet weak var movieRating: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = getImageURL()
        movieImage.af_setImage(withURL: URL(string: imageURL)!)
        print(selectedMovie.title)
        movieName.text = "\(selectedMovie.title!)"
        movieRating.text = String (selectedMovie.rating)
        /*movieReleaseYear.text = String (selectedMovie.releaseYear)
        movieGenre.text = selectedMovie.genre[0]*/
    }
    
    func getImageURL () -> String{
        
        let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = imageBaseUrl.appending(selectedMovie.image)
        return imageUrl
    }
    
}
