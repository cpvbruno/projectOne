//
//  SettingsViewController.swift
//  projectOne
//
//  Created by Bruno Pantaleão N. Gonçalves on 31/03/18.
//  Copyright © 2018 Bruno Pantaleão N. Gonçalves. All rights reserved.
//

import UIKit
import WebKit

class SettingsViewController: BaseViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.loadHTMLString("<meta name='viewport' content='width=device-width, user-scalable=no'><div style='margin: 0 auto;'><form action='https://www.paypal.com/cgi-bin/webscr' method='post' target='_top' style='margin: 0 auto;width: 146px;'><input style='margin: 0 auto;' type='hidden' name='cmd' value='_s-xclick'><input type='hidden' name='encrypted' value='-----BEGIN PKCS7-----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-----END PKCS7-----'><input type='image' style='margin: 0 auto;width: 146px;' src='https://www.paypalobjects.com/pt_BR/BR/i/btn/btn_donateCC_LG.gif' border='0' name='submit' alt='PayPal - A maneira fácil e segura de enviar pagamentos online!'><img alt='' border='0' src='https://www.paypalobjects.com/pt_BR/i/scr/pixel.gif' width='1' height='1'></form></div>", baseURL: nil)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
}
