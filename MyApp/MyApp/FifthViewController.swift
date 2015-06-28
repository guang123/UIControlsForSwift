//
//  FifthViewController.swift
//  MyApp
//
//  Created by luxiguang on 15/6/28.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class FifthViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    var dataName:[String]!
    var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "表"
        dataName = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("tableData", ofType: "plist")!) as! Array
        tableView = UITableView(frame: CGRectMake(0, 0, ScreenWith, Screenheight), style: .Plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        var header = UILabel(frame: CGRectMake(0, 0, ScreenWith, 30))
        header.backgroundColor = UIColor.redColor()
        header.text = "我是表头，厉害吧"
        tableView.tableHeaderView = header;

    }
    
    //MARK:UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataName.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identify:String = "tableCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as! UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.dataName[indexPath.row]
        return cell
    }
    
    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var alertView = UIAlertView()
        alertView.title = "提示"
        alertView.message = "嘿嘿选中\(self.dataName[indexPath.row])"
        alertView.addButtonWithTitle("确定")
        alertView.show()
    }
    //设置编辑风格
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        dataName.removeAtIndex(indexPath.row)
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
    }
    
    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String! {
        return "删"//修改删除按钮的文字
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
