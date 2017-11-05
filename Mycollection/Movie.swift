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
    
    var title : String!
    var image : String!
    var rating : Double!
    var releaseYear : Int!
    var genre : [String]!
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    
    init(title : String , image : String , rating : Double ,releaseYear : Int , genre : [String]) {
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
        
    }
    
    
    func mapping(map: Map) {
        title         <- map["title"]
        image         <- map["image"]
        rating        <- map["rating"]
        releaseYear   <- map["releaseYear"]
        genre         <- map["genre"]
        
    }
    
}
