//
//  MainController.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa

/// Main container for app
class MainController: NSViewController {
  // MARK: Dependencies

  var mainPresenter: MainPresenterProtocol?
  weak var webView: WebViewProtocol?

  // MARK: Life cycle

  override func viewDidLoad() {
    super.viewDidLoad()

    // FIXME: Because SwinjectStoryboard is not working for some reason,
    // I decided to inject dependencies manually here for now.
    mainPresenter = SwinjectAssembler.resolve(MainPresenterProtocol.self)
    mainPresenter?.mainView = self
    mainPresenter?.webView = webView
    mainPresenter?.webView?.mainPresenter = mainPresenter

    let appDelegate = NSApp.delegate as! AppDelegate
    appDelegate.mainController = self
    appDelegate.mainPresenter = mainPresenter

    // notify presenter about completion
    mainPresenter?.mainControllerDidLoad()
  }

  override func viewWillAppear() {
    super.viewWillAppear()
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }

  override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
    if let webView = segue.destinationController as? WebViewProtocol {
      self.webView = webView
    }
  }
}

// MARK: - MainViewProtocol

extension MainController: MainViewProtocol {}
