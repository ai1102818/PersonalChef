
//
//  Login_ViewController.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 2/12/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//


import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var Email_TF: UITextField!
    @IBOutlet weak var Password_TF: UITextField!
    @IBOutlet weak var Background: UIImageView!
    
    var tapRecognizer : UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Email_TF.borderStyle = UITextBorderStyle.RoundedRect
        Password_TF.borderStyle = UITextBorderStyle.RoundedRect
        tapRecognizer = UITapGestureRecognizer(target: self, action: "didTapAnywhere:")
        Background.image = self.getImageWithColor(UIColor(red: 51, green: 56, blue: 63), size: CGSize(width: 400, height: 400))
        self.view.backgroundColor = UIColor(red: 51, green: 56, blue: 63)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginCicked(sender: AnyObject) {
        self.performSegueWithIdentifier("LogintoMain", sender: self)
//        if(Email_TF.text!.isEmpty || Password_TF.text!.isEmpty)
//        {
//            let alert = UIAlertView(title: "", message: "Please enter your Email and Password", delegate: nil, cancelButtonTitle: "OK")
//            
//            alert.show()
//        }
//        else
//        {
//            
//            var objectManager = RKObjectManager.sharedManager()
//            
//            objectManager?.getObjectsAtPath("/login", parameters: ["username": Email_TF.text!,"pwd": Password_TF.text!],
//                success: {
//                    (operation, result) -> Void in
//                    
////                    
////                    var user = result!.firstObject() as User
////                    
//                    self.performSegueWithIdentifier("LogintoMain", sender: self)
//                    
//                    
//                }, failure: { (operation, error) -> Void in
//                    NSLog("\(error)")
//                    let alert = UIAlertView(title: "", message: "Incorrect Email or Password", delegate: nil, cancelButtonTitle: "OK")
//                    alert.show()
//            })
//            
//        }
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    func updateView(editing : Bool){
        
    }
    
    func keyboardWillShow(notification: NSNotification) {
        self.view.addGestureRecognizer(tapRecognizer)
        updateView(true)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        self.view.removeGestureRecognizer(tapRecognizer)
        updateView(false)
    }
    
    func didTapAnywhere(recognizer : UITapGestureRecognizer) {
        
        self.view.endEditing(true)
        
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
    
}


