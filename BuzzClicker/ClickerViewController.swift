//
//  ClickerViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/30/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import Alamofire
class ClickerViewController: UIViewController {

    let urlString = "http://buzzclicker.chjqiqmmih.us-west-2.elasticbeanstalk.com/CS102/msubmit"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func A_tapped(sender: AnyObject) {
        let answer = "a"
        
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
//                        if (result["success"] != nil) {
//                            let alertController = UIAlertController(title: "Failure", message:
//                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
//                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//
//                            self.presentViewController(alertController, animated: true, completion: nil)
//                        }
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }

    
    @IBAction func B_tapped(sender: AnyObject) {
        let answer = "b"
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }
    
    
    @IBAction func C_tapped(sender: AnyObject) {
        let answer = "c"
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }
    
    
    @IBAction func D_tapped(sender: AnyObject) {
        let answer = "d"
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }
    
    
    @IBAction func E_tapped(sender: AnyObject) {
        let answer = "e"
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }
    
    
    @IBAction func F_tapped(sender: AnyObject) {
        let answer = "f"
        Alamofire.request(.POST, urlString, parameters: ["question": "1", "username":"student:a", "answer":answer])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            let alertController = UIAlertController(title: "Failure", message:
                                "Sorry, your answer was not accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                        if (result["success"] == 1) {
                            let alertController = UIAlertController(title: "Success", message:
                                "Your answer was accepted", preferredStyle: UIAlertControllerStyle.Alert)
                            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                            
                            self.presentViewController(alertController, animated: true, completion: nil)
                        }
                    }
                }

        }

    }
    
    
    
}
