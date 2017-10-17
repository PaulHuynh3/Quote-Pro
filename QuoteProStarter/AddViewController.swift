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

    //you make the setter so you can set this as an observer. When the network request finishes the labels& images are set and changed.
    var quoteObject: QuoteObject? {
        didSet {
            // set labels and imageView as observers when the property changes it will update my labels
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
                print(#line, quoteObject)
                //set the current view equal to my current property quote.. my property quote is constantly changing everytime i generate new quote.
                self.quoteLabel.text = quoteObject.quote
                self.quoteAuthor.text = quoteObject.quoteAuthor
            }
        }
        
    }
    
    
    @IBAction func changePictureTapped(_ sender: UIButton) {
        NetworkRequest.fetchImage { (data:Data) in
            OperationQueue.main.addOperation {
            let image = UIImage(data: data)
            //save the image to my quote.image property
            self.quoteObject?.image = image
            //change the current imageview with this image
            self.imageView.image = image

            }
 
        }
        
    }

    
//SAVE button is attached to the unwind Segue which is reponsible for saving the image and the qutoe!... unwindSegue is found in MainViewController.

    
    
    
    

}
