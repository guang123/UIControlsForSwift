//
//  ThirdViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/26.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    @IBOutlet var butShowDatePick: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "时间选择器"
        datePicker.setDate(NSDate(), animated: true)
        datePicker.minimumDate = NSDate()//最小时间
        datePicker.timeZone = NSTimeZone(name: "GMT")//时区
    }


    @IBAction func showDatePick(sender: AnyObject) {
        var date = datePicker.date//获取选中时间
        var dformatter = NSDateFormatter() // 创建一个日期格式器
        dformatter.dateFormat = "yyyy-MM-dd"// 为日期格式器设置格式字符串
        var datestr = dformatter.stringFromDate(date)// 使用日期格式器格式化日期、时间
        var message =  "您选择的日期是：\(datestr)"
        let alertView = UIAlertView()
        alertView.title = "当前日期"
        alertView.message = message
        alertView.addButtonWithTitle("确定")
        alertView.show()
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
