//
//  MainViewController.swift
//  QuoteProStarter
//
//  Created by Paul on 2017-10-11.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    var arrayOfQuotes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
    
    }
    


    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
    
    
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
