//
//  ViewController.swift
//  Mycollection
//
//  Created by Doaa on 10/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper


class CollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout{

    
    var movies = [movie]()
    var alamofireObject = RequestWithAlamofire()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamofireObject.moviesRequest { (m) in
            
            self.movies = m
            self.collectionView?.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movies.count)
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as? movieCollectionCell
        
        let cellData = movies[indexPath.row]
        
        cell?.updateUI(cellData: cellData)
        
        return cell!
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = story.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
        detailsVC.selectedMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenSize = UIScreen.main.bounds
        let cellWidth = ((screenSize.width  / CGFloat(2.0)) - CGFloat(5.0))
        var cellSize = CGSize()
        cellSize.width = cellWidth
        cellSize.height = 300
        
        return cellSize
    }
    
    


}

