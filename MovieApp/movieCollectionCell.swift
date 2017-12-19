//
//  movieCollectionCell.swift
//  Mycollection
//
//  Created by Doaa on 10/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class movieCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    var imageBaseUrl : String = ""
    
    func updateUI(cellData: movie){
        
        imageBaseUrl = "https://image.tmdb.org/t/p/w500"
        let imageUrl = imageBaseUrl.appending(cellData.image)
        downloadMovieImage(url: imageBaseUrl.appending(cellData.image))
    }
    
    
    func downloadMovieImage(url : String){
        
        Alamofire.request(url).responseImage { response in
            
            if let image = response.result.value {
                self.cellImage.image = image
            }
        }
    }
}
