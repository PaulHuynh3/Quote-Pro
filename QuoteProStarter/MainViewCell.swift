//
//  MainViewCell.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteAuthorLabel: UILabel!
    @IBOutlet weak var saveImageView: UIImageView!
    
    //pass this into indexpath in mainViewController.
    //similar to setting it as the setter in objective c
    //the indexpath handles the quote,author and image and breaks it by indexpath section selected.
    func setQuote(quote: QuoteObject){
    quoteLabel.text = quote.quote
    quoteAuthorLabel.text = quote.quoteAuthor
    saveImageView.image = quote.image
    
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    
    
    }

    
    
    

}
