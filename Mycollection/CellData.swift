//
//  CellData.swift
//  Mycollection
//
//  Created by Doaa on 10/9/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation

class CellData {
    
    private var _imageURL : String!
    //private var _cellText : String!
    
    
    var imageURL :String{
        return _imageURL
    }
    
    //var cellText :String{
      //  return _cellText
    //}
    
    
    init(imageURL: String){
        _imageURL = imageURL
        //_cellText = Text
    }
}

