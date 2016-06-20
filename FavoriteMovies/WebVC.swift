//
//  WebVC.swift
//  FavoriteMovies
//
//  Created by spyrowin on 6/19/16.
//  Copyright © 2016 htainmyoaung. All rights reserved.
//

import UIKit
import WebKit

protocol DataEnteredDelegate{
    func markedWebURL(url:NSString)
}

class WebVC: UIViewController {
    
    //Variables
    var webView: WKWebView!
    var XPOS:CGFloat = 0
    var YPOS:CGFloat = 0
    var webURL = ""
    var delegate:DataEnteredDelegate? = nil
    var hideBookMark:Bool!
    
    //Outlets
    @IBOutlet weak var webContainer: UIView!
    @IBOutlet weak var bookmarkBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        webView = WKWebView()
        webContainer.addSubview(webView)
        
        bookmarkBtn.hidden = hideBookMark
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let frame = CGRectMake(XPOS, YPOS, webContainer.bounds.width, webContainer.bounds.height)
        
        webView.frame = frame
        
        
        if let url = NSURL(string: webURL) {
            let request = NSURLRequest(URL: url)
            
            webView.loadRequest(request)
        }
        
    }
    
    @IBAction func chooseCurrentPageTapped(sender: AnyObject){
        if (delegate != nil){
            let currentURL:NSString = (webView.URL?.absoluteString)!
            delegate!.markedWebURL(currentURL)
            backToPreviousPage()
//            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func backTapped(sender: AnyObject){
        backToPreviousPage()
    }

    func backToPreviousPage(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
