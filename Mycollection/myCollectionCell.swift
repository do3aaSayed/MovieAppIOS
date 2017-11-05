//
//  myCollectionCell.swift
//  Mycollection
//
//  Created by Doaa on 10/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class myCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    
    
    
    func updateUI(cellData: movie){
        
        //cellText.text = cellData.cellText
        
        //cellImage.image = UIImage (named: (cellData.imageURL))
        downloadMovieImage(url: cellData.image)
    }
    
    
    func downloadMovieImage(url : String){
        
        Alamofire.request(url).responseImage { response in
            /*debugPrint(response)
             
             print(response.request!)
             print(response.response!)
             debugPrint(response.result)*/
            
            if let image = response.result.value {
                print(image)
                self.cellImage.image = image
            }
        }
    }
}
