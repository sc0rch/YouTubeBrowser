//
//  MainRouter.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Foundation

protocol MainRouterProtocol: class {
  var webView: WebViewProtocol? { get set }

  /// Go to YouTube home page.
  func navigateToHome()
}

/// Router to navigate from main window to other windows or web pages.
class MainRouter: MainRouterProtocol {
  // MARK: Dependencies

  weak var webView: WebViewProtocol?

  // MARK: Navigation

  func navigateToHome() {
    let urlString = Constants.PageUrls.home.rawValue
    guard let url = URL(string: urlString) else {
      print("Invalid url: \(urlString)")
      return
    }

    webView?.navigateToUrl(url: url)
  }
}
