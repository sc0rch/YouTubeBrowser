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
  // MARK: Dependencies

  var mainPresenter: MainPresenterProtocol?

  // MARK: @IBOutlets

  @IBOutlet private var webView: WKWebView!

  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupWebView()
  }

  private func setupWebView() {
    webView.navigationDelegate = self

    webView.customUserAgent =
      Constants.WebKit.userAgent

    webView.configuration.mediaTypesRequiringUserActionForPlayback =
      Constants.WebKit.mediaTypesRequiringUserActionForPlayback
  }
}

// MARK: - WKNavigationDelegate

extension WebViewController: WKNavigationDelegate {
  func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    // inject javascript only once after page load
    injectJavascript()
  }

  private func injectJavascript() {
    // js functions to cleanup YouTube toolbar from clutter stuff not related to out app
    let cleanUiJsUrl = Bundle.main.url(forResource: "CleanUiFunctions", withExtension: "js")!
    let cleanUiJs = try! String(contentsOf: cleanUiJsUrl)

    // js functions to handle player stuff (mini player, fullscreen, autoplay, etc.)
    let playerJsUrl = Bundle.main.url(forResource: "PlayerFunctions", withExtension: "js")!
    let playerJs = try! String(contentsOf: playerJsUrl)

    // inject file used to execute after page load
    let injectJsUrl = Bundle.main.url(forResource: "Inject", withExtension: "js")!
    let injectJs = try! String(contentsOf: injectJsUrl)

    // join into single js file
    let js = [cleanUiJs, playerJs, injectJs].joined(separator: "\n")

    // execute and hope
    webView.evaluateJavaScript(js) { _, error in
      if let error = error {
        // TODO: Show execution error!
        print(error)
      } else {
        print("Javascript injected!")
      }
    }
  }
}

// MARK: - WebViewProtocol

extension WebViewController: WebViewProtocol {
  func navigateToUrl(url: URL) {
    webView.load(URLRequest(url: url))
  }
}
