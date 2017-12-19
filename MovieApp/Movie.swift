//
//  Movie.swift
//  Mycollection
//
//  Created by Doaa on 10/31/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation
import ObjectMapper

class movie : Mappable {
    
    var id : Int!
    var title : String!
    var image : String!
    var rating : Double!
   
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    
    init(id : Int , title : String , image : String , rating : Double) {
        self.id = id
        self.title = title
        self.image = image
        self.rating = rating
        
    }
    
    
    func mapping(map: Map) {
        id            <- map["id"]
        title         <- map["title"]
        image         <- map["poster_path"]
        rating        <- map["vote_average"]
        
    }
    
}
