//
//  LoginViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/20/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import Alamofire

protocol UserClassListDelegate {
    func userClassList(list:Array<String>)
}
class LoginViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var txtUsername: UITextField!
    
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    var delegate: UserClassListDelegate? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        self.delegate?.userClassList(newArray)
        
        // Do any additional setup after loading the view.
    }
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "mySegue") {
//            var DestViewController: ClassListViewController = segue.destinationViewController as! ClassListViewController
//            DestViewController.ClassList = ["CS1122", "CS3322"]
//        }
//        
//        //string field = myField.Text;
////        var DestViewController: UITabBarController = segue.destinationViewController as! UITabBarController
//       
//    }

    @IBAction func btn_login(sender: UIButton) {
        //authentication code
        let user = txtUsername.text
        let pass = txtPassword.text
        
        let urlString = "http://buzzclicker.chjqiqmmih.us-west-2.elasticbeanstalk.com/mlogin"
        //urlString = urlString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        Alamofire.request(.POST, urlString, parameters: ["username": user!, "password":pass!])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization

                if let JSON = response.result.value {
                    //print("JSON: \(JSON)")
                    self.jsonArray = JSON as? NSMutableArray
                    for item in self.jsonArray! {
                        self.newArray.append(String(item))
                    }
                    
                    
//                    if (self.delegate != nil) {
//                        print(self.newArray)
//                        let information:Array<String> = self.newArray
//                        self.delegate!.userClassList(information)
//                    } else {
//                        self.delegate!.userClassList(self.newArray)
//                    }
                    
                    if (self.newArray.count > 0) {

                        let myTabBar = self.storyboard?.instantiateViewControllerWithIdentifier("tabView") as! UITabBarController
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.window?.rootViewController = myTabBar
                    }

                }
        }
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
