//
//  MenuViewController.swift
//  Rate My Professor
//
//  Created by Abdelrazek Tarek on 1/11/16.
//  Copyright © 2016 Abdelrazek Tarek. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.setBackgroundImage(getImageWithColor(UIColor(red: 52, green: 73, blue: 98), size: CGSize(width: 20.0, height: 20.0)), forBarMetrics: UIBarMetrics.Default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.translucent = false
//        self.navigationController?.navigationBar.titleTextAttributes = [ NSForegroundColorAttributeName : UIColor.whiteColor()]
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuCell", forIndexPath: indexPath) as! MenuTableViewCell
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "Home"
            
            cell.iconView.image = UIImage(named:"HomeIcon")
//        case 1:
//            cell.titleLabel.text = "Leaderboard"
//            
//            cell.iconView.image = UIImage(named:"Leaderboard")
//        case 2:
//            cell.titleLabel.text = "Settings"
//            
//            cell.iconView.image = UIImage(named:"Settings")
        default:
            cell.titleLabel.text = "Home"
            
            cell.iconView.image = UIImage(named:"HomeIcon")
        }
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 68
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    @IBAction func didClickLogout(sender: AnyObject) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
