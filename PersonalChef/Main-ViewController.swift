//
//  Main-ViewController.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 2/12/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//

import UIKit

class mainViewcontroller:UIViewController,
    UITableViewDelegate,
    UISearchBarDelegate,
    UITableViewDataSource,
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    KYDrawerControllerDelegate{
    
    var searchNav:UISearchBar!
    var leftButton:UIBarButtonItem!
    var rightButton:UIBarButtonItem!
//    var searchResults: Array<Product> = []
    var imageCache = [String : UIImage]()
    var objectManager = RKObjectManager.sharedManager()
    var num_requests = 0
    
    @IBOutlet weak var SearchResultTableView: UITableView!
    @IBOutlet weak var NavBarRightButton: UIBarButtonItem!
    @IBOutlet weak var NavBarLeftButton: UIBarButtonItem!
    @IBOutlet weak var OffersTableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton = self.NavBarLeftButton
        rightButton = self.NavBarRightButton
        
        searchNav = UISearchBar(frame: CGRectZero)
        searchNav.searchBarStyle = UISearchBarStyle.Prominent
        searchNav.tintColor = UIColor.blueColor()
        self.navigationItem.titleView = searchNav
        searchNav.placeholder = "Search"
        
        searchNav.delegate = self
        
        self.navigationController?.navigationBar.setBackgroundImage(getImageWithColor(UIColor(red: 52, green: 73, blue: 98), size: CGSize(width: 20.0, height: 20.0)), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.translucent = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateView(editing : Bool){
        
        UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut , animations: {
            
            if(editing){
                self.SearchResultTableView.alpha = 1
                self.view.bringSubviewToFront(self.SearchResultTableView)
                let cancelButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "searchBarCancelButtonClicked")
                cancelButton.tintColor = UIColor.whiteColor()
                self.navigationItem.rightBarButtonItem = cancelButton
                self.navigationItem.leftBarButtonItem = nil
            }else{
                self.SearchResultTableView.alpha = 0
                self.view.sendSubviewToBack(self.SearchResultTableView)
                self.navigationItem.leftBarButtonItem = self.leftButton
                self.navigationItem.rightBarButtonItem = self.rightButton
            }
            
            self.updateViewConstraints()
            self.view.layoutIfNeeded()
            }, completion:
            { finished in
                
            }
        )
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
//            searchResults = []
            SearchResultTableView.reloadData()
        }else{
            loadData(searchText)
        }
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        updateView(true)
    }
    
    
    func searchBarCancelButtonClicked(){
        self.view.endEditing(false)
        searchNav.resignFirstResponder()
        updateView(false)
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
    
    func loadData( Query : String){
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        objectManager?.cancelAllObjectRequestOperationsWithMethod(RKRequestMethod.Any, matchingPathPattern: "/searchProduct")
        num_requests += 1
        objectManager?.getObjectsAtPath("/searchProduct", parameters: ["name": Query],
            success: {
                (operation, result) -> Void in
//                self.searchResults = result!.array() as Array<Product>
//                self.SearchResultTableView.reloadData()
//                self.num_requests -= 1
//                if(self.num_requests == 0){
//                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
//                }
                
            }, failure: { (operation, error) -> Void in
                NSLog("\(error)")
                self.num_requests -= 1
                if(self.num_requests == 0){
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                }
        })
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if( tableView.tag == 10){
            return 0
        }else{
            return 5
        }

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if( tableView.tag == 10){
            return 85
        }else{
            return 216
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if( tableView.tag == 10){
            let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as! SearchSuggestCell
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("sellerCell") as! SellerTableViewCell
            
            cell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, index: indexPath.row)
            
            cell.SellerName.text = "3asaf"
            cell.DishessCollectionView.tag = indexPath.row
            cell.SeeAllButton.tag = indexPath.row
            
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if( tableView.tag == 10){
            self.performSegueWithIdentifier("", sender: self)
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func didTapMenuButton(sender: AnyObject) {
        if let drawerController = self.navigationController?.parentViewController as? KYDrawerController {
            drawerController.setDrawerState(.Opened, animated: true)
        }
    }
    
    func drawerController(drawerController: KYDrawerController, stateChanged state: KYDrawerController.DrawerState) {
        if(state == KYDrawerController.DrawerState.Opened){
            self.view.endEditing(true)
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DishCell", forIndexPath: indexPath) as! DishCollectionViewCell
        
        cell.DishName.text = "Mashbos"
        cell.DishPrice.text = "15.00$"
        cell.DishImage.image = UIImage(named: "ProfilePicPlaceholder")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("\(collectionView.tag)")
    }
    
}
