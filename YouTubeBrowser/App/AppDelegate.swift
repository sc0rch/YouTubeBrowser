//
//  AppDelegate.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  var mainWindow: MainWindow?

  func applicationDidFinishLaunching(_: Notification) {}

  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    mainWindow?.window?.makeKeyAndOrderFront(self)
    return false
  }

  func applicationWillTerminate(_: Notification) {}
}
