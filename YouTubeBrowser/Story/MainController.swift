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
  }

  override var representedObject: Any? {
    didSet {
      // Update the view, if already loaded.
    }
  }
  
  @IBAction func openHome(_ sender: AnyObject) {
    mainPresenter.navigateToHome()
  }
}

extension MainController: MainViewProtocol {}
