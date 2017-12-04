//
//  Alamofire.swift
//  Mycollection
//
//  Created by Doaa on 11/5/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class RequestWithAlamofire{
    
    let url_to_request = "https://api.themoviedb.org/3/movie/popular?api_key=cd816dc09b72c3ddab5b84c0949d0bdf"
    
    
    func dataRequestUsingAlamofire(setMovies : @escaping (_ movies : [movie])->())->(){
        
        Alamofire.request(url_to_request).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
              let results = (json as! [String : Any])["results"] as! [[String : Any]]
              let movies = Mapper<movie>().mapArray(JSONArray: results)
              setMovies(movies)
            }
            
            
        }
        
    }

}
