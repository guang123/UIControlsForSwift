//
//  ModalViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/24.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController,UIAlertViewDelegate,UIActionSheetDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    let ScreenWith = UIScreen.mainScreen().bounds.width
    let Screenheight = UIScreen.mainScreen().bounds.height
    var uiswitch:UISwitch!
    var imageView:UIImageView!
    var slider:UISlider!
    var pickerView:UIPickerView!
    var stepper:UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUISwitch()
        setSegmentControl()
        setImageView()
        setProgressView()
        setSlider()
        setAlertControll()
        setActionSheel()
        setPickVie()
        setStepper()
    }
    
    override  func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        imageView.startAnimating()//开始动画
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        imageView.stopAnimating()//结束动画
    }
     //MARK:设置UIStepper
    func setStepper()
    {
        stepper = UIStepper(frame: CGRectMake(10, 350, 0, 0))
        //stepper.setDecrementImage(UIImage(named: "lower.png"), forState: UIControlState.Normal)
        //stepper.setIncrementImage(UIImage(named: "add.png"), forState: UIControlState.Normal)
        stepper.maximumValue = 100
        stepper.minimumValue = 1
        stepper.value = 5
        stepper.stepValue = 1//设置每次增减的值
        stepper.continuous = true//是否可以按住不放连续更改值
        stepper.wraps = true;//是否循环（到最大值时再增加数值从最小值开始）
        stepper.addTarget(self,action:"stepperAction",forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(stepper)
    }
    
    func stepperAction(){
        println("\(stepper.value)")
    }
    
    //MARK:设置UIPickerView
    func setPickVie(){
        var but = UIButton(frame: CGRectMake(150, 300, 80, 30))
        but.setBackgroundImage(UIImage(named: "nonaml_btn"), forState: UIControlState.Normal)
        but.setTitle("pickView", forState: UIControlState.Normal)
        but.addTarget(self, action: "setPickView", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(but)
    }
    
    func setPickView(){
        pickerView = UIPickerView()
        pickerView.frame = CGRectMake(0, Screenheight-80-64, ScreenWith, 80)
        pickerView.dataSource = self;
        pickerView.delegate = self;
        pickerView.selectRow(0, inComponent: 0, animated: true)//设置选择框的默认值
        pickerView.selectRow(1, inComponent: 1, animated: true)
        pickerView.selectRow(2, inComponent: 2, animated: true)
        self.view.addSubview(pickerView)
        
        //创建一个按钮获取选择框被选中的索引
        var button = UIButton(frame: CGRectMake(110, 20, 100, 30))
        button.backgroundColor = UIColor.redColor()
        button.setTitle("获取信息", forState: .Normal)
        button.addTarget(self, action: "getPickerViewValue", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    //触摸按钮时，获得被选中的索引
    func getPickerViewValue(){
        var alertView=UIAlertView();
        alertView.title="被选中的索引为"
        alertView.message=String(pickerView.selectedRowInComponent(0))+"-"+String(pickerView!.selectedRowInComponent(1))+"-"+String(pickerView.selectedRowInComponent(2))
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3;
    }
    
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9;
    }
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(pickerView:UIPickerView,titleForRow row: Int,forComponent component: Int)
        -> String!{
            return toString(row)+"-"+toString(component)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        println(component)
        println(row)
    }
    
    //设置列宽
    func pickerView(pickerView: UIPickerView,widthForComponent component: Int) -> CGFloat{
        if(00 == component){
            //第一列变宽
            return 50
        }else{
            //第二、三列变窄
            return 50
        }
    }
    
    //设置行高
    func pickerView(pickerView: UIPickerView,rowHeightForComponent component: Int) -> CGFloat{
        return 30
    }
    
    
    //MARK:设置UIActionSheel
    func setActionSheel(){
        var but = UIButton(frame: CGRectMake(150, 250, 80, 30))
        but.setBackgroundImage(UIImage(named: "nonaml_btn"), forState: UIControlState.Normal)
        but.setTitle("选择栏", forState: UIControlState.Normal)
        but.addTarget(self, action: "setAction", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(but)
    }
    
    func setAction(){
        var actionSheet = UIActionSheet()
        actionSheet.title = "嘿嘿"
        actionSheet.addButtonWithTitle("取消")
        actionSheet.addButtonWithTitle("选择一")
        actionSheet.addButtonWithTitle("选择二")
        actionSheet.cancelButtonIndex = 0
        actionSheet.showInView(self.view)
        //actionSheet.showFromToolbar(self.navigationController.toolbar)  //工具条的情况下
        //actionSheet.showFromTabBar(self.tabBar)  //标签条的情况下
        actionSheet.delegate = self;
    }
    //代理方法
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        println("点击了：", actionSheet.buttonTitleAtIndex(buttonIndex))
    }
    
    //MARK:设置UIAlertView
    func setAlertControll()
    {
        var but = UIButton(frame: CGRectMake(10, 250, 80, 30))
        but.setBackgroundImage(UIImage(named:"nonaml_btn"), forState: UIControlState.Normal)
        but.setTitle("警告框", forState: UIControlState.Normal)
        but.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        but.addTarget(self, action: "setAlert", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(but)
    }
    
    func setAlert(){
        var alertView = UIAlertView()
        alertView.title = "系统登录"
        alertView.message = "请输入用户名和密码"
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确定")
        alertView.cancelButtonIndex = 0
        alertView.delegate = self
        alertView.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        alertView.show()
    }
    //代理方法
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if(buttonIndex==alertView.cancelButtonIndex){
            println("点击了取消")
        }
        else
        {
            let name = alertView.textFieldAtIndex(0)
            let password = alertView.textFieldAtIndex(1)
            println("用户名是：\(name!.text) 密码是：\(password!.text)")
        }
    }
    
    //MARK:设置滑块UISlider
    func setSlider()
    {
        slider = UISlider(frame: CGRectMake(10, 220, 200, 20))
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumValueImage = UIImage(named: "lower")
        slider.maximumValueImage = UIImage(named: "add")
        slider.maximumTrackTintColor = UIColor.redColor()
        slider.minimumTrackTintColor = UIColor.greenColor()
        slider.addTarget(self, action: "sliderAction:", forControlEvents: UIControlEvents.ValueChanged)
        slider.value = 0.5
        self.view.addSubview(slider)
    }
    
    func sliderAction(slide:UISlider)
    {
        println(slider.value)
        slide.setValue(slide.value, animated: true)
    }
    
    //MARK:设置进度条UIProgressView
    func setProgressView()
    {
        var progress = UIProgressView(progressViewStyle: UIProgressViewStyle.Default)
        progress.frame = CGRectMake(10, 200, 200, 0);
        progress.progress = 0.5
        progress.progressTintColor = UIColor.greenColor()//已有进度颜色
        progress.trackTintColor = UIColor.blueColor()//剩余进度颜色
        progress.setProgress(0.8, animated: true);//设置进度同时有动画效果
        self.view.addSubview(progress)
    
    }
    
    //MARK:设置UIImage
    ///设置ImageView 给方法添加文档描述
    func setImageView()
    {
        imageView = UIImageView()
        //imageView=UIImageView(image:UIImage(named:"nonaml_bat"))
        imageView.frame=CGRectMake(10,130,50,50)
        imageView.animationImages  = [UIImage(named: "4")!,UIImage(named: "5")!] as [AnyObject]//设置动画图片
        imageView.animationDuration = 0.5;//设置动画间隔秒数
/*
        imageView.image = UIImage(named: "nonaml_btn")
        从文件中获取
        let path = NSBundle.mainBundle().pathForResource("apple", ofType: "png")
        var newImage = UIImage(contentsOfFile: path!)
        从网络中获取

        定义NSURL对象
        let url = NSURL(string: "http://hangge.com/blog/images/logo.png")
        从网络获取数据流
        var data = NSData(contentsOfURL: url!)
        通过数据流初始化图片
        var newImage = UIImage(data: data!)
*/
        self.view.addSubview(imageView)
    }
    //MARK:设置分段控件
    func setSegmentControl()
    {
        //选项除了文字还可以是图片
        var items = ["选项一","选中二"] as [AnyObject]
        var segmented = UISegmentedControl(items:items)
        segmented.frame = CGRectMake(60, 90, 200, 30)
        segmented.selectedSegmentIndex=1 //默认选中第二项
        segmented.addTarget(self, action: "segmentDidchange:",forControlEvents: UIControlEvents.ValueChanged)  //添加值改变监听
        segmented.tintColor = UIColor.blueColor()
        self.view.addSubview(segmented)
        //segmented.setContentOffset(CGSizeMake(10,7),forSegmentAtIndex:1)修改选项内容偏移位置
        //segmented.setImage(UIImage(named:"icon"),forSegmentAtIndex:2)修改选项图片
    }
    
    func segmentDidchange(segmented:UISegmentedControl)
    {
        //获得选项的索引
        println(segmented.selectedSegmentIndex)
        //获得选择的文字
        println(segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex))
        if segmented.selectedSegmentIndex == 0
        {
            segmented.setTitle("选项二",forSegmentAtIndex:1)
            if segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex) == "选项一"
            {
                segmented.setTitle("选中一",forSegmentAtIndex:0)
            }else
            {
                segmented.setTitle("选项一",forSegmentAtIndex:0)
            }
            
        }else
        {
            segmented.setTitle("选项一",forSegmentAtIndex:0)
            if segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex) == "选项二"
            {
                segmented.setTitle("选中二",forSegmentAtIndex:1)
            }else
            {
                segmented.setTitle("选项二",forSegmentAtIndex:1)
            }
        }
    }
    
    //MARK:设置开关控件
    func setUISwitch()
    {
        uiswitch = UISwitch()
        //设置位置（开关大小无法设置）
        uiswitch.center=CGPointMake(100,50);
        //设置默认值
        uiswitch.on=true;
        uiswitch.addTarget(self, action: Selector("switchDidChange"),
            forControlEvents:UIControlEvents.ValueChanged)
        self.view.addSubview(uiswitch);
    }
    
    func switchDidChange(){
        //打印当前值
        println(uiswitch.on)
        if uiswitch.on
        {
            println("选中");
        }else
        {
            println("取消选中");
        }
    }

    @IBAction func backAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil);
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
