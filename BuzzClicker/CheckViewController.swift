//
//  CheckViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/27/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation
class CheckViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myLabel: UILabel!

    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    var find = 0
    var className = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    override func viewDidDisappear(animated: Bool) {
        self.locationManager.stopRangingBeaconsInRegion(self.region)
    }
    
    @IBAction func check_tapped(sender: UIButton) {
        if (self.find == 2) {
            self.myLabel.text = "You have successfully checked in "
        } else if (self.find == 1) {
            self.myLabel.text = "You have already checked in "
        } else if (self.find == 0) {
            self.myLabel.text = "Class Not Found! Search Again"
            sender.setTitle("Search Again", forState: UIControlState.Normal)
            self.find = 3
            locationManager.startRangingBeaconsInRegion(region)
        } else if (self.find == 3) {
            sender.setTitle("Check In", forState: UIControlState.Normal)
        }
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        //print(beacons)
        //let knownBeacons = beacons.filter{$0.proximity != CLProximity.Unknown}
        let urlString = "http://buzzclicker.chjqiqmmih.us-west-2.elasticbeanstalk.com/checkmajor"
//        let urlString = "http://143.215.92.32:8081/checkmajor"
        let knownBeacons = beacons
        var majorList: Array<Int> = []
        print("the knwonbeacons: " , knownBeacons)
        if (knownBeacons.count > 0) {
            for item in knownBeacons {
                let beaconfind = item as CLBeacon
                let major = beaconfind.major.integerValue
                majorList.append(major)
                print("now sending major: " , major)
            }
        }
        if (majorList.count > 0) {
            print(majorList)
            self.locationManager.stopRangingBeaconsInRegion(self.region)

            Alamofire.request(.POST, urlString, parameters: ["majors": majorList], encoding: .JSON)
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
                            if (result["success"] == 0) { //not found
                                self.find = 0
                            }
                            if (result["success"] == 1) { //success
                                self.find = 1
                                //self.className = result["classroom"].string!
                            }
                            if (result["success"] == 2) { //already checkin
                                self.find = 2
                                //self.className = result["classroom"].string!
                            }
                        }
                    }
            }
            
        }
        if (find == 0) {
            self.locationManager.startRangingBeaconsInRegion(region)
        }

       
    }


}
