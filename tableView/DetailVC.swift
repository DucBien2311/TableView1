//
//  DetailVC.swift
//  tableView
//
//  Created by NguyenDucBien on 1/4/17.
//  Copyright © 2017 NguyenDucBien. All rights reserved.
//

import UIKit

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var stringTitle: String! // Hiển thị 1 title lên Navigationbar
    var dictData : NSDictionary! // Lấy dữ liệu
    var arrayKeys: NSArray! // Lay ra mot mang chua cac key trong dictionary
    var imageDetail: ImageDetail!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = stringTitle
        self.creatDataWithName(stringTitle)
        
        
        
        
        self.tableView.registerClass((UITableViewCell.self), forCellReuseIdentifier: "Cell") //Hien thi du lieu len tableView
        
    }
    
    func creatDataWithName(title: String) {
        var path: String = ""
        if (title == "Fruits")
        {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        if (title == "Animals")
        {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        if (title == "Vegetables")
        {
            path = NSBundle.mainBundle().pathForResource("VegetablesList", ofType: "plist")!
        }
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
        arrayKeys = arrayKeys.sortedArrayUsingSelector(#selector(NSNumber.compare(_:))) // Sắp xếp theo thứ tự a-z
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let key: String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    //MARK: Tableview Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if imageDetail == nil
        {
            imageDetail = self.storyboard?.instantiateViewControllerWithIdentifier("ImageDetail") as! ImageDetail
        }
        self.navigationController?.pushViewController(imageDetail, animated: true)
    }
    
    
    
    
}
