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
    
    let url_to_request = "https://api.androidhive.info/json/movies.json"
    
    
    func dataRequestUsingAlamofire(didSetMovies : @escaping (_ movies : [movie])->())->(){
        
        Alamofire.request(url_to_request).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
              let movies = Mapper<movie>().mapArray(JSONArray: json as! [[String : Any]])
              didSetMovies(movies)
            }
            
            
        }
        
    }

}
