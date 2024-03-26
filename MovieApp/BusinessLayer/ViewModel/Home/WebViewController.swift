//
//  WebViewController.swift
//  MovieApp
//
//  Created by Cavidan Mustafayev on 19.03.24.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    @IBOutlet weak var webView:WKWebView!
    var movie:MovieCellProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url:URL(string:"https://www.youtube.com/results?search_query=\(movie?.titleString ?? "title string error webView")+movie+trailer")!))
        
    }

}
