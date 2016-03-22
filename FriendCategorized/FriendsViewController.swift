//
//  FriendsViewController.swift
//  FriendCategorized
//
//  Created by nagata on 3/22/16.
//  Copyright © 2016 nagata. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var categoriKey: String = ""
    var friends: [String:String] = [:]
    var selectId: Int!
    var friendNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        friends = ["ぬっきー":"","ながた":"","ななこ":"","はやきょう":"","ふるやん":"","いとそ":"","たじまっくす":"","わんだ":""]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        for friendName in friends.keys {
            friendNames.append(friendName)
        }
        cell.textLabel?.text = friendNames[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let name = friendNames[indexPath.row]
        let url = NSURL(string:"fb://profile/"+friends[name]!)
        UIApplication.sharedApplication().openURL(url!)
    }


}
