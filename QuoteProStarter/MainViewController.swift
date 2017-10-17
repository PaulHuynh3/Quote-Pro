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
        
    }
    
    
    //Attached to save button. When save button is click this action is triggered..
    //unwind allows you to access another viewController and pull the information from there.
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        if let addViewController = segue.source as? AddViewController {
            arrayOfQuotes.append(addViewController.quoteObject!)
        
            tableView.reloadData()

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
        
        //when i use the unwind for segue pulling just the QuoteObject itself...
        //indexforpath is responsible for the object and breaks it into quote, quoteAuthor, image when the object itself is return
        cell.quoteLabel.text = quotes.quote
        cell.quoteAuthorLabel.text = quotes.quoteAuthor
        cell.saveImageView.image = quotes.image
        
        
        return cell
    }
    
    
    
     // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
        if (segue.identifier  == "DetailedSegue"){
            
            
         //has to identify the view controller
        let detailedView = segue.destination as! ViewController
            
            
        //indexpath
            
       let indexPath = self.tableView.indexPathForSelectedRow
            
            //set object equal to the identified row.
        detailedView.quoteObject = arrayOfQuotes[(indexPath?.row)!]
            
        }
        
        
     }
    

 
    
}
