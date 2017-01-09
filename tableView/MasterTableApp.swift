//
//  MasterTableApp.swift
//  tableView
//
//  Created by NguyenDucBien on 1/4/17.
//  Copyright © 2017 NguyenDucBien. All rights reserved.
//

import UIKit

class MasterTableApp: UITableViewController {
    var dictList = ["Fruits": "fruits.png", "Animals": "animals.jpeg", "Vegetables": "vegetables.jpg"]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        var arrayKey = Array(dictList.keys)
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowDetail")
        {
            let detailVC = segue.destinationViewController as! DetailVC
            
            let selectedRowIndex: NSIndexPath = self.tableView.indexPathForSelectedRow! // lay chi so indexRow
            let selectedCell: UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)!
            
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
    
 
    
}

 