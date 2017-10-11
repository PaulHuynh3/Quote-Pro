//
//  QuoteObject.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class QuoteObject: CustomStringConvertible{


    var quote: (String)
    var quoteAuthor: (String)?
    
    
    //created another network request for the photo and when i call the nextwork request there it will be used here.
    var image: UIImage?
    
    init(info:Dictionary<String, String>){
        self.quote = info["quoteText"]!
        self.quoteAuthor = info["quoteAuthor"]
    }
    
    
    var description: String {
        return "\(quote) by \(quoteAuthor ?? "anonymous")"
    }
}

