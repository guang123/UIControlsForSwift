//
//  ViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/24.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    //swift中没有宏定义
    let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0;
    let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0;
    let ScreenWith = UIScreen.mainScreen().bounds.width;
    @IBOutlet var didTapModal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main";
        fitIOS();
        setLabel();
        setTextField();
        setTextView();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true);
    }
    //MARK:-适配IOS7
    func fitIOS()
    {
        if IS_IOS7
        {
            self.edgesForExtendedLayout = .None;
            self.extendedLayoutIncludesOpaqueBars = true;
        }
    }
    //MARK:-设置控件
    func setLabel(){
        var label = UILabel(frame: CGRectMake(10, 20, 200, 30));
        label.text = "我是一个标签";
        label.textColor = RGBA(0.0, g:255.0, b:0.0,  a:1.0);
        label.backgroundColor = UIColor.blackColor();
        label.textAlignment = NSTextAlignment.Left;//对齐方式
        label.font = UIFont(name: "随便写", size: 20.0);
        label.lineBreakMode = NSLineBreakMode.ByTruncatingTail;//隐藏尾部  ByTruncatingMiddle ：隐藏中间部分并显示省略号  ByTruncatingHead：隐藏头部并显示省略号  ByClipping：截去多余部分也不显示省略号
        label.adjustsFontSizeToFitWidth = true;//文字大小自适应标签
        label.numberOfLines = 2;//显示两行
        label.highlighted = true;//设置文本高亮
        label.highlightedTextColor = RGBA(0.0, g:255.0, b:0.0,  a:1.0);//设置高亮颜色
        self.view.addSubview(label);
        /*
        //富文本设置
        var attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
            range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(),
            range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(),
            range: NSMakeRange(3,3))
        label.attributedText = attributeString
        */
    }
    
    func setTextField(){
        var textFidle = UITextField(frame: CGRectMake(10, 60, ScreenWith - 20, 30));
        textFidle.borderStyle = UITextBorderStyle.RoundedRect;//RoundedRect：圆角矩形边框 Bezel：边线+阴影 Line：直线边框 None：无边框
        textFidle.placeholder="我是UITextField";
        textFidle.textAlignment = .Center //水平居中对齐
        textFidle.contentVerticalAlignment = .Top  //垂直向上对齐
        textFidle.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        textFidle.minimumFontSize=14  //最小可缩小的字号
        textFidle.clearButtonMode = UITextFieldViewMode.WhileEditing;//编辑时出现清除按钮
        textFidle.keyboardType = UIKeyboardType.Default;//设置键盘类型
        textFidle.returnKeyType = UIReturnKeyType.Done;//设置return键样式
        textFidle.background=UIImage(named:"nonaml_btn");
        textFidle.delegate = self;
        self.view.addSubview(textFidle);
    }
    
    func setTextView(){
        var textView = UITextView(frame: CGRectMake(10, 100, ScreenWith - 20, 80));
        textView.font = UIFont.systemFontOfSize(20.0);
        textView.layer.borderWidth = 1;//边框宽带
        textView.layer.borderColor = UIColor.redColor().CGColor;
        textView.editable = true;//是否可编辑
        textView.selectable = true;//内容是否可以选择
        textView.textColor = UIColor.redColor();
        textView.textAlignment = NSTextAlignment.Center;
        textView.dataDetectorTypes = UIDataDetectorTypes.All;//Link：只给网站添加链接  None：都不加链接  PhoneNumber：只有电话加链接 All：电话和网址都加
        setTextViewSelectContent();//自定义选择内容后的菜单
        textView.returnKeyType = UIReturnKeyType.Done;
        textView.delegate = self;
        self.view.addSubview(textView);
        
    }
    
    //MARK:-按钮点击事件
    @IBAction func didTapAction(sender: AnyObject) {
        var modalVC = ModalViewController(nibName:"ModalViewController",bundle:nil);
        
        presentViewController(modalVC, animated: true, completion: nil);
        
    }

    @IBAction func firstAction(sender: AnyObject) {
        var firstVC = FirstViewController(nibName:"FirstViewController", bundle:nil);
        navigationController?.pushViewController(firstVC, animated: true);
    }
    
    @IBAction func sectionAction(sender: AnyObject) {
        var secondVC = SecondViewController(nibName:"SecondViewController",bundle:nil);
        navigationController?.pushViewController(secondVC, animated: true)
    }
    

    @IBAction func thirdAction(sender: AnyObject) {
        var thirdVC = ThirdViewController(nibName:"ThirdViewController",bundle:nil)
        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @IBAction func fourthAction(sender: AnyObject) {
        var fourthVC = FourthViewController(nibName:"FourthViewController",bundle:nil)
        navigationController?.pushViewController(fourthVC, animated: true)
    }
   
    @IBAction func fifthAction(sender: AnyObject) {
        var fitthVC = FifthViewController(nibName:"FifthViewController", bundle:nil)
        navigationController?.pushViewController(fitthVC, animated: true)
    }
    @IBAction func sixthAction(sender: AnyObject) {
        var sixthVC = SixthViewController(nibName:"SixthViewController", bundle:nil)
        navigationController?.pushViewController(sixthVC, animated: true)
    }
    //MARK: -私有方法
    func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)-> UIColor
    {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    func setTextViewSelectContent(){
        var mail = UIMenuItem(title: "邮件", action: "onMail")
        var weixin = UIMenuItem(title: "微信", action: "onWeiXin")
        var menu = UIMenuController()
        menu.menuItems = NSArray(array: [mail,weixin]) as [AnyObject]
    }
    
    func onMail(){
        println("mail")
    }
    
    func onWeiXin(){
        println("weixin")
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        println(textField.text)
        return true;
    }
    //MARK: UITextViewDelegate
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool
    {
        if text == "\n"
        {
            textView.resignFirstResponder();
        }
        return true;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

