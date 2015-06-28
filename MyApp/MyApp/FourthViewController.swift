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
    var mainIndication:UIActivityIndicatorView!//风火轮
    var time:NSTimer!//计时器
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "浏览器"
        mainProgress.progress = 0
        
        mainIndication = UIActivityIndicatorView(frame: CGRectMake(100, 100, 32, 32))
        mainIndication.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(mainIndication)
        
        //创建计时器
        time = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "initProgerss", userInfo: nil, repeats: true)
        time.invalidate()//停止计时器
    }
    
    //时间方法
    func initProgerss(){
        if mainProgress.progress >= 1.0
        {
            time.invalidate()
        }else
        {
            mainProgress.setProgress(mainProgress.progress + 0.02, animated: true)
        }
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
        time.invalidate()
        mainProgress.setProgress(1.0, animated: false)
    }
    
    //MARK:UISearchBarDelegate
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        var url = searchBar.text
        println("URL:\(url)")
        var urlObj = NSURL(string: url)
        var request = NSURLRequest(URL: urlObj!)
        searchBar.resignFirstResponder()
        searchBar.text = ""
        mainWebView.loadRequest(request)
    }
    
    //MARK:UIWebViewDelegate
    func webViewDidStartLoad(webView: UIWebView) {
        mainProgress.setProgress(0.0, animated: false)
        time.fire()//开始计时
        mainIndication.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        mainIndication.stopAnimating()
        mainProgress.setProgress(1, animated: true)
        time.invalidate()
        
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        
        mainIndication.stopAnimating()
        mainProgress.setProgress(1, animated: true)
        time.invalidate()
        
        var alert = UIAlertView()
        alert.title = "访问出错"
        alert.message = error.localizedDescription
        alert.addButtonWithTitle("确定")
        alert.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
