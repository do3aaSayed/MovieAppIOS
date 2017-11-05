//
//  NSSession.swift
//  Mycollection
//
//  Created by Doaa on 10/22/17.
//  Copyright © 2017 Doaa. All rights reserved.
//

import Foundation

class NSSession {

let url_to_request = "https://api.androidhive.info/json/movies.json"

func data_request(){
    
    let url:NSURL = NSURL(string: url_to_request)!
    
    let session = URLSession.shared
    
    let request = NSMutableURLRequest(url: url as URL)
    request.httpMethod = "GET"
    
    
    //request.httpBody = data(using: String.Encoding.utf8)
    
    
    let task = session.dataTask(with: request as URLRequest) {
        (
         data, response, error) in
        
        guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
            print("error")
            return
        }
        
        let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        print(dataString!)
        
        var titles = [String]()
        do {
            if let data = data,
                let movies = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]{
                /*let first = movies[0]
                print (first["title"]!)*/
                for movie in movies {
                    if let name = movie["title"] as? String {
                        titles.append(name)
                    }
                }
                print(titles)
            }
        } catch {
            print("Error deserializing JSON: \(error)")
        }
    }
    
    task.resume()

    }
}
