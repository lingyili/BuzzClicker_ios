//
//  ClassListViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 3/27/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit
import Alamofire

class ClassListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var myView: UITableView!
    
    
  
    
    //var ClassList: Array<String> = ["CS101", "CS100", "CS123"]
    let ClassList = NSUserDefaults.standardUserDefaults().objectForKey("myClassList") as? Array<String>
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.dataSource = self
        myView.delegate = self
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
         myView.tableFooterView = UIView(frame: CGRectZero)
         myView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClassList!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! customCell
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView = blurView
        cell.layer.cornerRadius = 10
        
        cell.className?.text = ClassList![indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showClass", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier=="showClass") {
            let indexPaths = self.myView.indexPathForSelectedRow!
            let indexPath = indexPaths as NSIndexPath
            let vc = segue.destinationViewController as! ClassViewController
            
            vc.currentClass = self.ClassList![indexPath.row]
            
            
        }
    }
    
    
    @IBAction func logout_tapped(sender: AnyObject) {
        
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
