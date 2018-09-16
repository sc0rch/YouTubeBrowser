//
//  MainPresenter.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Foundation

// MARK: - MainViewProtocol

protocol MainViewProtocol: class {
  var mainPresenter: MainPresenterProtocol? { get set }
}

// MARK: - WebViewProtocol

protocol WebViewProtocol: class {
  var mainPresenter: MainPresenterProtocol? { get set }

  func navigateToUrl(url: URL)
}

// MARK: - MainPresenterProtocol

protocol MainPresenterProtocol: class {
  var mainView: MainViewProtocol? { get set }
  var webView: WebViewProtocol? { get set }

  func mainControllerDidLoad()
  func navigateToHome()
}

// MARK: - MainPresenter

/// Use MainPresenter to execute view-related logic.
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
