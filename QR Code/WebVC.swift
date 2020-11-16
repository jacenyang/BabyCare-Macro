//
//  WebVC.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 16/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class WebVC: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    
    var url = URL(string: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlReq = URLRequest(url: url!)
        webView.loadRequest(urlReq)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
