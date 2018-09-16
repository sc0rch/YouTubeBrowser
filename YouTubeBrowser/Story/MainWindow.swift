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
  }
}
