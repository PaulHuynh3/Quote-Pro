//
//  NetworkRequest.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation

class NetworkRequest {
    
    class func generateRandomQuote(completionHandler: @escaping (QuoteObject) -> Void) {
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let components = URLComponents(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json") else { return }
        
        var request = URLRequest(url: components.url!)
        
        request.httpMethod = "GET"
        
        //the data is store in "data"
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            // error testing
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            
            // TODO: check the response code we got; if it's >= 300 something is wrong
            // remember to check status code, we need to cast response to a NSHTTPURLResponse
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                return
            }
            //assign the array of data equal to data
            guard let data = data else {
                return
            }
            
            //create an empty object to collect the quote
            var quote : QuoteObject!
            
            
            //if the jsonserialization works put it in the empty array
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? Dictionary<String, String> {
                    // another way to save it beside the array
                    quote = QuoteObject(info: json)
                    
                }
            }
                //if it doesnt work print out error
            catch {
                print(#line, error.localizedDescription)
            }
            
            
            
            //save the quoteObject as the completion handler
            if (quote != nil) {
                completionHandler(quote)
            }
            
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    
    
    
    static func fetchImage(completion: @escaping (Data) ->() ){
        
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        guard let URL = URL(string: "http://lorempixel.com/200/300/fashion/") else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let downloadTask = session.downloadTask(with: request) { (url: URL?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(#line, error.localizedDescription)
                return
            }
            
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                return
            }
            
            guard let url = url else {
                return
            }
            
            //save the data image into the completion handler and then setting it there..
            do {
                let data = try Data(contentsOf: url)
                
                //save image in the completion block
                completion(data)
            }
            catch {
                print(#line, error.localizedDescription)
            }

        }
        
        downloadTask.resume()
        session.finishTasksAndInvalidate()
        
    }
    
}
