//
//  SecondViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/25.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController,UIScrollViewDelegate {
    var numberOfPage = 3
    var netRotation : CGFloat = 1;//旋转
    var lastScaleFactor : CGFloat! = 1  //放大、缩小
    @IBOutlet var topView: UIView!
    @IBOutlet var moveView: UIView!
    @IBOutlet var RotationView: UIView!
    @IBOutlet var pinchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
        self.title = "手势/滚动视图"
        //各种手势都是UIGestureRecognizer子类，可以实现其代理方法。对手势进行拦截
        setTopGesture()
        setMoveGesture()
        setRotationGesture()
        setPinchGesture()
    }
    //MARK:缩放手势
    func setPinchGesture(){
        var pinchGestute = UIPinchGestureRecognizer(target: self, action: "pinchGestute:")
        pinchView.addGestureRecognizer(pinchGestute)
    }
    
    func pinchGestute(recognizer:UIPinchGestureRecognizer){
        var factor = recognizer.scale
        if factor > 1{
            //放大
            pinchView.transform = CGAffineTransformMakeScale(lastScaleFactor+factor-1, lastScaleFactor+factor-1)
        }else{
            //缩小
            pinchView.transform = CGAffineTransformMakeScale(lastScaleFactor*factor, lastScaleFactor*factor)
        }
        //状态是否结束，如果结束保存数据
        if recognizer.state == UIGestureRecognizerState.Ended{
            if factor > 1{
                lastScaleFactor = lastScaleFactor + factor - 1
            }else{
                lastScaleFactor = lastScaleFactor * factor
            }
        }
    }
    //MARK:旋转手势
    func setRotationGesture()
    {
        var rotationGesture = UIRotationGestureRecognizer(target: self, action: "rotationGesture:")
        RotationView.addGestureRecognizer(rotationGesture)
    }
    
    func rotationGesture(recognizer:UIRotationGestureRecognizer){
        var rotation:CGFloat = recognizer.rotation
        RotationView.transform = CGAffineTransformMakeRotation(rotation + netRotation)
        if recognizer.state == UIGestureRecognizerState.Ended{
            netRotation += rotation//状态结束保存数据
        }
    }
    //MARK:设置滑动手势
    func setMoveGesture(){
        var moveGesture = UISwipeGestureRecognizer(target: self, action: "moveGesture:")
        moveGesture.direction = UISwipeGestureRecognizerDirection.Right//设置监听滑动的方向为右边(默认设置)
        moveView.addGestureRecognizer(moveGesture)
    }
    
    func moveGesture(recognizer:UISwipeGestureRecognizer)
    {
        var point = recognizer.locationInView(moveView)
        moveView.frame = CGRectMake(point.x + viewFramX(moveView), viewFramY(moveView), viewFramW(moveView), viewFramH(moveView))
    }
    
    //MARK:设置单击双击手势
    func setTopGesture(){
        //单击手势
        var tapSigle = UITapGestureRecognizer(target: self, action: "tapGesture")
        tapSigle.numberOfTapsRequired = 1
        tapSigle.numberOfTouchesRequired = 1
        //双击手势
        var tapDouble = UITapGestureRecognizer(target: self, action: "tapDoubleGesture")
        tapDouble.numberOfTapsRequired = 2
        tapDouble.numberOfTouchesRequired = 1
        tapSigle.requireGestureRecognizerToFail(tapDouble)//设置手势优先级
        topView.addGestureRecognizer(tapDouble)
        topView.addGestureRecognizer(tapSigle)
        //长按手势UILongPressGestureRecognizer
        //拖动手势UIPanGestureRecognizer
    }
    
    func tapGesture(){
        println("单击手势")
    }
    
    func tapDoubleGesture(){
        println("双击手势");
    }
    
    //MARK:设置UIScrollView
    func setScrollView(){
        var scroll = UIScrollView(frame: CGRectMake(0, 0, ScreenWith, 200))
        //scroll.minimumZoomScale=0.1 //最小比例
        //scroll.maximumZoomScale=3 //最大比例
        scroll.delegate = self
        scroll.contentSize = CGSizeMake(CGFloat(ScreenWith * CGFloat(numberOfPage)), 200)//imageView.bounds.size;
        scroll.pagingEnabled = true//开启分页
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        for i in 0..<numberOfPage
        {
            var imageView = UIImageView()
            imageView=UIImageView(image:UIImage(named:"about_ourself_bg"))
            imageView.frame=CGRectMake(ScreenWith * CGFloat(i), 0, ScreenWith, 200)
            scroll.addSubview(imageView)
        }
        
        self.view.addSubview(scroll)
    }
    
    //视图滚动中一直触发
    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    //缩放代理
    func viewForZoomingInScrollView( scrollView: UIScrollView) -> UIView?{
        for subview : AnyObject in scrollView.subviews {
            if subview.isKindOfClass(UIImageView) {
                return subview as? UIView
            }
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
