//
//  AddViewController.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var quoteObject: QuoteObject? {
        didSet {
            // set labels and imageView
            self.quoteLabel.text = quoteObject?.quotes
            self.imageView.image = quoteObject?.image
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkRequest.generateRandomQuote { (quoteObject: QuoteObject) in
            print(#line, quoteObject)
            NetworkRequest.fetchImage(completion: { (data: Data) in
                let image = UIImage(data: data)
                quoteObject.image = image
                self.quoteObject = quoteObject
            })
        }
    }

    

}
