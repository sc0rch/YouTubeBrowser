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
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    injectJavascript()
  }

  private func injectJavascript() {
    let cleanUiJsUrl = Bundle.main.url(forResource: "CleanUiFunctions", withExtension: "js")!
    let cleanUiJs = try! String(contentsOf: cleanUiJsUrl)

    let injectJsUrl = Bundle.main.url(forResource: "Inject", withExtension: "js")!
    let injectJs = try! String(contentsOf: injectJsUrl)

    let js = [cleanUiJs, injectJs].joined(separator: "\n")

    webView.evaluateJavaScript(js) { _, error in
      if let error = error {
        // TODO: Show execution error!
        print(error)
      } else {
        // TODO: Show execution error!
        print("Javascript called!")
      }
    }
  }
}

extension WebViewController: WebViewProtocol {
  func navigateToUrl(url: URL) {
    webView.load(URLRequest(url: url))
  }
}
