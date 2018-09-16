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
  // MARK: Dependencies

  var mainWindow: MainWindow?
  var mainController: MainController?
  var mainPresenter: MainPresenterProtocol?

  // MARK: @IBOutlets

  @IBOutlet var alwaysOnTopMenuItem: NSMenuItem!

  // MARK: NSApplicationDelegate

  func applicationDidFinishLaunching(_: Notification) {}

  func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
    mainWindow?.window?.makeKeyAndOrderFront(self)
    alwaysOnTopMenuItem.state = .off
    return false
  }

  func applicationWillTerminate(_: Notification) {}

  // MARK: Menu menu

  @IBAction func openHome(_ sender: AnyObject) {
    mainPresenter?.navigateToHome()
  }

  @IBAction func toggleAlwaysOnTop(_ sender: NSMenuItem) {
    guard let window = self.mainWindow?.window else { return }
    window.level = (window.level == .floating) ? .normal : .floating
    alwaysOnTopMenuItem.state = (window.level == .floating) ? .on : .off
  }
}
