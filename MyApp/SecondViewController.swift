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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScrollView()
    }
    
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
    func viewForZoomingInScrollView( scrollView: UIScrollView!) -> UIView!{
        for subview : AnyObject in scrollView.subviews {
            if subview.isKindOfClass(UIImageView) {
                return subview as UIView
            }
        }
        return nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
