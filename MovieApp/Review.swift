//
//  Review.swift
//  Mycollection
//
//  Created by Doaa on 12/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation
import ObjectMapper

class review : Mappable {
    
    var authorName : String!
    var authorReview : String!
    
    /*var authorName :String{
    return _authorName
    }
    
    var authorReview :String{
        return _authorReview
    }*/
    
    required init?(map: Map) {
        
    }
    
    init() {
        
    }

    
    init(authorName: String, authorReview: String){
        self.authorName = authorName
        self.authorReview = authorReview
    }
    
    func mapping(map: Map) {
        authorName            <- map["author"]
        authorReview         <- map["content"]
        /*releaseYear   <- map["releaseYear"]
         genre         <- map["genre"]*/
        
    }
    
}
