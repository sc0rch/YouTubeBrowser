//
//  WebViewController.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa
import WebKit

class WebViewController: NSViewController {
  var mainPresenter: MainPresenterProtocol!

  @IBOutlet private var webView: WKWebView!

  override func viewDidLoad() {
    super.viewDidLoad()

    setupWebView()

    mainPresenter = SwinjectAssembler.resolve(MainPresenterProtocol.self)
    mainPresenter.webView = self
  }

  private func setupWebView() {
    webView.navigationDelegate = self
    webView.configuration.mediaTypesRequiringUserActionForPlayback = .all
    webView.customUserAgent = Constants.WebKit.userAgent
  }
}

extension WebViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {}
}

extension WebViewController: WebViewProtocol {
  func navigateToUrl(url: URL) {
    webView.load(URLRequest(url: url))
  }
}
