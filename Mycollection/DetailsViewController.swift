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
    
    @IBOutlet weak var movieName: UITextView!
    
    @IBOutlet weak var movieGenre: UITextView!
    
    @IBOutlet weak var movieReleaseYear: UITextView!
    
    @IBOutlet weak var movieRating: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        movieImage.af_setImage(withURL: URL(string: selectedMovie.image)!)
        print(selectedMovie.title)
        movieName.text = selectedMovie.title
        movieGenre.text = selectedMovie.genre[0]
        movieRating.text = String (selectedMovie.rating)
        movieReleaseYear.text = String (selectedMovie.releaseYear)
    }
    
}
