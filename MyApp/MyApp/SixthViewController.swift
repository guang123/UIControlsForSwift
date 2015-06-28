//
//  SixthViewController.swift
//  MyApp
//
//  Created by luxiguang on 15/6/28.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var mainCollectView: UICollectionView!
    var mainCellNib:UINib!
    let courses = [
        ["name":"课程一","pic":"remove.png"],
        ["name":"课程二","pic":"4.png"],
        ["name":"课程三","pic":"5.png"],
        ["name":"课程四","pic":"add.png"],
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.floorResultCollectionView.registerClass(SixthCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.mainCollectView.registerClass(SixthCollectionViewCell.self, forCellWithReuseIdentifier: "SixthCollectionViewCell")
    }

    //MARK:UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let identify:String = "DesignViewCell"
        // 获取设计的单元格，不需要再动态添加界面元素
        if (mainCellNib != nil)
        {
            mainCellNib = UINib(nibName: "SixthCollectionViewCell", bundle: nil)
            collectionView .registerNib(mainCellNib, forCellWithReuseIdentifier: identify)
        }
        let cell = mainCollectView.dequeueReusableCellWithReuseIdentifier(identify, forIndexPath: indexPath) as! SixthCollectionViewCell
        
        (cell.contentView.viewWithTag(1)  as! UIImageView).image =
        UIImage(named: courses[indexPath.item]["pic"]!)
        (cell.contentView.viewWithTag(2) as! UILabel).text = courses[indexPath.item]["name"]
        return cell
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

}
