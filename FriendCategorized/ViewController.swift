//
//  ViewController.swift
//  FriendCategorized
//
//  Created by nagata on 3/22/16.
//  Copyright © 2016 nagata. All rights reserved.
//

import UIKit

//事前準備
//①storyboardにtableviewをおく
//②tagの設定

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var categories: [String] = []
    var selectId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        categories = ["LifeisTech","デザイン","プログラミング"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //identifierをstoryboardで設定する
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        let label: UILabel = cell.viewWithTag(1) as! UILabel
        label.text = categories[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectId = indexPath.row
        self.performSegueWithIdentifier("toFriend", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let friendsVC = segue.destinationViewController as! FriendsViewController
        friendsVC.categoriKey = categories[selectId]
    }

}

