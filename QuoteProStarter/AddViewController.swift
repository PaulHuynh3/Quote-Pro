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
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    //you make the setter so you can set this as an observer.
    var quoteObject: QuoteObject? {
        didSet {
            // set labels and imageView
            self.quoteLabel.text = quoteObject?.quote
            self.quoteAuthor.text = quoteObject?.quoteAuthor
            self.imageView.image = quoteObject?.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkRequest.generateRandomQuote { (quoteObject: QuoteObject) in
            print(#line, quoteObject)
            NetworkRequest.fetchImage(completion: { (data: Data) in

                OperationQueue.main.addOperation {
                    let image = UIImage(data: data)
                    quoteObject.image = image
                    //set the labels and image inside the mainqueue
                    self.quoteObject = quoteObject
                    
                }
            
            })
        }
    }

    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    

}
