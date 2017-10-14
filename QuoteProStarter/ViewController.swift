//
//  ViewController.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quoteObject:QuoteObject?
        
//        didSet{
//            quoteView.quote.text = quoteObject?.quote
//            quoteView.quoteAuthor.text = quoteObject?.quoteAuthor
//            quoteView.imageView.image = quoteObject?.image
//        }

    
    var quoteView: QuoteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteView = Bundle.main.loadNibNamed("QuoteView", owner: nil)?.first as? QuoteView
        view = quoteView
        quoteView.cameraButton.addTarget(self, action: #selector(buttonTapped(sender:)) , for: .touchUpInside)
        
        quoteView.quote.text = quoteObject?.quote
        quoteView.quoteAuthor.text = quoteObject?.quoteAuthor
        quoteView.imageView.image = quoteObject?.image
        
    }
    
    @objc func buttonTapped(sender: UIButton) {
        
        
        guard let image = UIImage.snapshot(view: quoteView) else {
            fatalError()
        }
        let activity = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activity, animated: true)
    }
    
    
}

extension UIImage {
    static func snapshot(view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

