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
    var releaseYear : Int!
    var genre : [String]!
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }
    
    
    init(id : Int , title : String , image : String , rating : Double ,releaseYear : Int , genre : [String]) {
        self.id = id
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
        
    }
    
    
    func mapping(map: Map) {
        id            <- map["id"]
        title         <- map["title"]
        image         <- map["poster_path"]
        rating        <- map["vote_average"]
        /*releaseYear   <- map["releaseYear"]
        genre         <- map["genre"]*/
        
    }
    
}
