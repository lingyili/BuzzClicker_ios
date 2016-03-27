//
//  CheckInViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/21/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import CoreLocation

class CheckInViewController: UIViewController, CLLocationManagerDelegate{
    
    
    
    @IBOutlet var class_name: UILabel!
  
    
    @IBOutlet var checked: UIButton!
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!, identifier: "Estimotes")
    let colors = [
        44543: UIColor(red:84/255, green:77/255, blue:160/255, alpha:1),
        50180: UIColor(red:142/255, green:212/255, blue:220/255, alpha:1),
        27327: UIColor(red:162/255, green:213/255, blue:181/255, alpha:1)
    ]
    let class_num = [
        44543: "CS4261",
        50180: "CS3210",
        18924: "CS3220"
    ]
    var beaconArray: Array<CLBeacon> = []
    var Class = [String]()
    var ClassList: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeaconsInRegion(region)
        print(ClassList)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion) {
        //print(beacons)
        //let knownBeacons = beacons.filter{$0.proximity != CLProximity.Unknown}
        let knownBeacons = beacons
        if (knownBeacons.count > 0) {
            for item in knownBeacons {
                self.beaconArray.append(item)
            }
            let closestBeacon = knownBeacons[0] as CLBeacon
            print(closestBeacon)
            let i = closestBeacon.minor.integerValue
            print(i)
            print(self.class_num[i]!)
            let string = self.class_num[i]!
            self.class_name.text = string as! String
        }
        else {
            self.class_name!.text = "Class not Found!"
        }
       
    }
    
}
