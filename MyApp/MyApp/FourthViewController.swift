//
//  FourthViewController.swift
//  MyApp
//
//  Created by Yx on 15/6/26.
//  Copyright (c) 2015年 Yx. All rights reserved.
//

import UIKit

class FourthViewController: BaseViewController,UIWebViewDelegate,UISearchBarDelegate {

    @IBOutlet var searchB: UISearchBar!
    @IBOutlet var mainLiftBar: UIBarButtonItem!
    @IBOutlet var mainrightBar: UIBarButtonItem!
    @IBOutlet var mainReplyBar: UIBarButtonItem!
    @IBOutlet var mainStopBar: UIBarButtonItem!
    @IBOutlet var mainProgress: UIProgressView!
    @IBOutlet var mainWebView: UIWebView!
    var time:NSTimer!//计时器
    override func viewDidLoad() {
        super.viewDidLoad()
        mainProgress.progress = 0
        
    }
    //前进按钮
    @IBAction func liftAction(sender: AnyObject) {
        mainWebView.goBack()
    }
    //后退按钮
    @IBAction func rightAction(sender: AnyObject) {
        mainWebView.goForward()
    }
    //刷新按钮
    @IBAction func replyAction(sender: AnyObject) {
        mainWebView.reload()
    }
    //停止加载按钮
    @IBAction func stopAction(sender: AnyObject) {
        mainWebView.stopLoading()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
