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
  }

  override func viewWillAppear() {
    super.viewWillAppear()
    
    view.window?.title = Localization.Main.title
    view.window?.minSize = NSSize(width: 320.0, height: 240.0)
    view.window?.setContentSize(NSSize(width: 800.0, height: 550.0))
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
}

extension MainController: MainViewProtocol {}
