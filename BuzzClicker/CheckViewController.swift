//
//  CheckViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/27/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import Alamofire
class CheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func check_tapped(sender: UIButton) {
        let urlString = "http://buzzclicker.chjqiqmmih.us-west-2.elasticbeanstalk.com/checkin"
        let token = String("8A0BDB89-364E-424E-A42C-1E182358DB2C".characters.reverse())
        Alamofire.request(.POST, urlString, parameters: ["token": token, "classroom":"CS102"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                print(response.result.isSuccess)
                if let value: AnyObject = response.result.value {
                    let result = JSON(value)
                    print("The post is: " + result.description)
                    if let title = result["success"].string {
                        // to access a field:
                        print("The title is: " + title)
                    } else {
                        print(result["success"])
                        if (result["success"] == 0) {
                            sender.setTitle("You have already checked in!", forState: UIControlState.Normal)
                        }
                        if (result["success"] == 1) {
                            sender.setTitle("You have successfully checked in!", forState: UIControlState.Normal)
                        }
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
