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


class CollectionViewController: UICollectionViewController {

    //@IBOutlet var myCollection: UICollectionView!
    
    /*@IBAction func navigate(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "VC2")
        self.navigationController?.pushViewController(vc, animated: true)
        /*self.present(vc, animated: true) {
            nil
        }*/
    }*/
    var movies = [movie]()
    var alamObj = RequestWithAlamofire()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alamObj.dataRequestUsingAlamofire { (movies) in
            
            self.movies = movies
            self.collectionView?.reloadData()
        }

        
        
        
        /*let c1 = CellData(imageURL: "background.jpg")
        let c2 = CellData(imageURL: "background.jpg")
        let c3 = CellData(imageURL: "background.jpg")

        
        cells.append(c1)
        cells.append(c2)
        cells.append(c3)*/

        
        /*let nssession : NSSession = NSSession()
        
        nssession.data_request()*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollectionCell", for: indexPath) as? myCollectionCell
        
        let cellData = movies[indexPath.row]
        
        cell?.updateUI(cellData: cellData)
        
        return cell!
    }
    
    
    
    /*func dataRequestUsingAlamofire(){
        
        Alamofire.request(url_to_request).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                self.movies = Mapper<movie>().mapArray(JSONArray: json as! [[String : Any]])
                self.collectionView?.reloadData()
            }
            
            
        }
        
    }*/
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let story = UIStoryboard(name: "Main", bundle: nil)
        let detailsVC = story.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
        detailsVC.selectedMovie = movies[indexPath.row]
        self.navigationController?.pushViewController(detailsVC, animated: true)
        
        /*self.present(vc, animated: true) {
            
         }*/
    }


}

