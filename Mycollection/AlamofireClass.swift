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
    
    let baseUrl = "https://api.themoviedb.org/3/movie/"
    let apiKey = "api_key=cd816dc09b72c3ddab5b84c0949d0bdf"
    //let moviesUrlToRequest = "https://api.themoviedb.org/3/movie/popular?api_key=cd816dc09b72c3ddab5b84c0949d0bdf"
    
    
    func moviesRequest(setMovies : @escaping (_ movies : [movie])->())->(){
        
        Alamofire.request("\(baseUrl)\"/popular?\(apiKey)").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
              let results = (json as! [String : Any])["results"] as! [[String : Any]]
              let movies = Mapper<movie>().mapArray(JSONArray: results)
              setMovies(movies)
            }
            
            
        }
        
        func reviewsRequest(selectedMovieId : Int , setReviews : @escaping (_ reviews : [review])->())->(){
            
            Alamofire.request("\(baseUrl)\(selectedMovieId)/reviews?\(apiKey)").responseJSON { response in
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    let results = (json as! [String : Any])["results"] as! [[String : Any]]
                    let reviews = Mapper<review>().mapArray(JSONArray: results)
                    setReviews(reviews)
                }
                
                
            }
        
        }
    }

}
