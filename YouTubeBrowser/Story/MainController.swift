//
//  MainController.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa

class MainController: NSViewController {
  var mainPresenter: MainPresenterProtocol!

  override func viewDidLoad() {
    super.viewDidLoad()
    mainPresenter = SwinjectAssembler.resolve(MainPresenterProtocol.self)
    mainPresenter.mainView = self
    mainPresenter.mainControllerDidLoad()

    let appDelegate = NSApp.delegate as! AppDelegate
    appDelegate.mainController = self
    appDelegate.mainPresenter = mainPresenter
  }

  override func viewWillAppear() {
    super.viewWillAppear()
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
}

extension MainController: MainViewProtocol {}
