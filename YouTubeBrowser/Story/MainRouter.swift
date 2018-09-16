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

  func navigateToHome()
}

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
