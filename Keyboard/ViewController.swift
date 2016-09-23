//
//  ViewController.swift
//  Keyboard
//
//  Created by Fnu, Rohit on 9/21/16.
//  Copyright © 2016 Fnu, Rohit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var defaults  = ["textFontSize":12]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://stackoverflow.com/questions/39638019/resizing-text-in-uiwebview-swift-3")
        
        
        let urlRequest = NSURLRequest(url: url! as URL)
        
        webView.loadRequest(urlRequest as URLRequest)
        
    }
    
    func changeWebViewFontSize(zoomInOrZoomOut: Int, webView: UIWebView)
    {
        //1 = decreace
        //2 = increace
        var textFontSizeTemp = defaults["textFontSize"]! as Int
        
        
        switch zoomInOrZoomOut
        {
        case 1: //when decrease
            textFontSizeTemp  = textFontSizeTemp - 20
        case 2: //when increase
            textFontSizeTemp = textFontSizeTemp + 20
        default:
            break
        }
        
        defaults["textFontSize"] = textFontSizeTemp
        
        
        let jsString = "document.getElementsByTagName('body')[0].style.fontSize='\(textFontSizeTemp)px'"
        webView.stringByEvaluatingJavaScript(from: jsString)
    }
    
    //UIButton Action
    @IBAction func zoomOutButton_TouchUpInside(_ sender: AnyObject)
    {
        changeWebViewFontSize(zoomInOrZoomOut: 1,webView: webView)
    }
    
    @IBAction func zoomInButton_TouchUpInside(sender: AnyObject)
    {
        changeWebViewFontSize(zoomInOrZoomOut: 2,webView: webView)
    }
    
}

