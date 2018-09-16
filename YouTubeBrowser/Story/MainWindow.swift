//
//  MainWindow.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa

class MainWindow: NSWindowController {
  override func windowDidLoad() {
    super.windowDidLoad()

    let appDelegate = NSApp.delegate as! AppDelegate
    appDelegate.mainWindow = self

    window?.title = Localization.Main.title
    window?.minSize = NSSize(width: 320.0, height: 210.0)
    window?.setContentSize(NSSize(width: 800.0, height: 550.0))
  }
}
