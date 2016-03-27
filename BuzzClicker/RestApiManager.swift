//
//  RestApiManager.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/20/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestApiManager : NSObject {
    static let sharedInstance = RestApiManager()
    
    let baseURL = "http://buzzclicker.chjqiqmmih.us-west-2.elasticbeanstalk.com／"
    func getRandomUser(onCompletion: (JSON) -> Void) {
        
    }
    func makeHTTPGetRequest(path:String, onCompletion: ServiceResponse) {
        let request = NSMutableURLRequest(URL: NSURL(string: path)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
            let json:JSON = JSON(data!)
            onCompletion(json, error)
        })
        task.resume()
    }
}
