//
//  ViewController.swift
//  testR&B
//
//  Created by Vladimir on 27.11.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import WebKit
import UIKit

protocol isPageLoadedDelegate {
    func openPage()
}

class WebViewController: UIViewController, WKNavigationDelegate, isPageLoadedDelegate {
    
    let webView = WKWebView()
    var firstLoad = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = webView
        webView.navigationDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if firstLoad == true{
            openLoadPage()
            firstLoad = false
        }
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
                print("no connection")
    }
    
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        print("loaded")
        self.dismiss(animated: true, completion: nil)
    }
    
    func openPage(){
        let url = URL(string: "https://www.apple.com")!
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func openLoadPage(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoadViewController") as! LoadViewController
        vc.delegate = self
        self.present(vc, animated: true)
    }

}
