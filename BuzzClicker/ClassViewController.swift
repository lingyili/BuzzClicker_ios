//
//  ClassViewController.swift
//  BuzzClicker
//
//  Created by Lingyi Li on 4/2/16.
//  Copyright © 2016 Lingyi Li. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet var cellView: CollectionViewCell!
    
    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var collectionView: UICollectionView!
    
    let imageArray = [1: UIImage(named:"unchecked"),
                      0: UIImage(named:"notcheckedin")]

    let dateArray = ["2015-10-10", "2015-10-12", "2015-10-14", "2015-10-16", "2015-10-20", "2015-10-18"]
    let attendanceArray = [0,1,1,1,0,0]
    
    var currentClass = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dateArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        cell.backgroundColor = UIColor.clearColor()
        cell.backgroundView = blurView
        cell.layer.cornerRadius = 10
        cell.date?.text = self.dateArray[indexPath.row]
        cell.image?.image = self.imageArray[self.attendanceArray[indexPath.row]]!
        
        return cell
        
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
