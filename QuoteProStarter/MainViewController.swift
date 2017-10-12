//
//  MainViewController.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrayOfQuotes: [QuoteObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkRequest.generateRandomQuote{ (result:QuoteObject) in
            self.arrayOfQuotes = [result]
            OperationQueue.main.addOperation{
                self.tableView.reloadData()
            }
            
        }
        
    }
    
    
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 1
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.arrayOfQuotes.count
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellIdentifier = "Cell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier, for:indexPath) as? MainViewCell  else
        {
            
            fatalError()
        }
        
        let quotes = arrayOfQuotes[indexPath.row]
        
        cell.quoteLabel.text = quotes.quote
        cell.quoteAuthorLabel.text = quotes.quoteAuthor
        
        
        return cell
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
