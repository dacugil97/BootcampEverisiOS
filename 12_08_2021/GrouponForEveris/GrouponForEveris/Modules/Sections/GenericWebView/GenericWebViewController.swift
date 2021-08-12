//
//  GenericWebViewController.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 11/8/21.
//

import UIKit
import WebKit

class GenericWebViewController: UIViewController {
        
    // MARK: - Variables
    var url: String?
    var myWebView: WKWebView?
    
    // MARK: - IBOutlets
    @IBOutlet weak var contentWebView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.loadWebView()
    }
    
    private func setupView() {
        self.title = "Cupon for Ever"
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        let contentVC = WKUserContentController()
        let config = WKWebViewConfiguration()
        let preferences = WKWebpagePreferences()
        
        preferences.allowsContentJavaScript = true
        self.myWebView = WKWebView(frame: self.contentWebView.bounds, configuration: config)
        self.myWebView?.configuration.userContentController = contentVC
        self.myWebView?.navigationDelegate = self
        self.contentWebView.addSubview(self.myWebView ?? WKWebView())
        self.contentWebView.addSubview(self.activityIndicator)
        
    }
    
    private func loadActive(show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        self.activityIndicator.isHidden = !show
    }
    
    private func loadWebView() {
        self.myWebView?.load(URLRequest(url: URL(string: self.url ?? "")!))
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

}

extension GenericWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.loadActive(show: true)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loadActive(show: false)
    }
}
