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

    //you make the setter so you can set this as an observer. When the network request finishes the labels& images are set.
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
            print("3")
            NetworkRequest.fetchImage(completion: { (data: Data) in
                print("2")
                OperationQueue.main.addOperation {
                    print("1")
                    let image = UIImage(data:data)
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
    
    
    @IBAction func generateQuoteTapped(_ sender: UIButton) {
        NetworkRequest.generateRandomQuote { (quoteObject: QuoteObject) in
            OperationQueue.main.addOperation {
                self.quoteLabel.text = quoteObject.quote
                self.quoteAuthor.text = quoteObject.quoteAuthor
            }
        }
        
        
        
        
        
    }
    
    
    @IBAction func changePictureTapped(_ sender: UIButton) {
        NetworkRequest.fetchImage { (data:Data) in
            OperationQueue.main.addOperation {
            self.imageView.image = UIImage(data: data)
            }
 
        }
        
    }

    
//SAVE button is attached to the unwind Segue

    
    
    
    

}
