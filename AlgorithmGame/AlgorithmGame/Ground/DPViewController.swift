//
//  DPViewController.swift
//  AlgorithmGame
//
//  Created by 张驰 on 2019/6/17.
//  Copyright © 2019 张驰. All rights reserved.
//

import UIKit

import WebKit
import ProgressHUD

class DPViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.navigationItem.title = "动态规划学习"
        //创建wkwebview
        let webview = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        //创建网址
        let url = NSURL(string: "https://www.soulblack.top/article/20")
        //创建请求
        let request = NSURLRequest(url: url! as URL)
        //加载请求
        webview.load(request as URLRequest)
        //添加wkwebview
        self.view.addSubview(webview)
        cancelUIVC(self, title: "动态规划学习")
    }
    


}
