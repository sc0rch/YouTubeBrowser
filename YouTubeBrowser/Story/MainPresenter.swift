//
//  MainPresenter.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Foundation

protocol MainViewProtocol: class {
}

protocol WebViewProtocol: class {
  func navigateToUrl(url: URL)
}

protocol MainPresenterProtocol: class {
  var mainView: MainViewProtocol? { get set }
  var webView: WebViewProtocol? { get set }

  func mainControllerDidLoad()
  func navigateToHome()
}

class MainPresenter: MainPresenterProtocol {
  // MARK: Dependencies

  var mainRouter: MainRouterProtocol
  weak var mainView: MainViewProtocol?
  weak var webView: WebViewProtocol? {
    didSet {
      mainRouter.webView = webView
    }
  }

  // MARK: Life cycle

  init(mainRouter: MainRouterProtocol) {
    self.mainRouter = mainRouter
  }

  func mainControllerDidLoad() {
    mainRouter.navigateToHome()
  }
  
  // MARK: Navigation
  
  func navigateToHome() {
    mainRouter.navigateToHome()
  }
}
