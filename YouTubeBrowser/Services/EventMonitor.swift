//
//  EventMonitor.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa

/// Very simple event monitor to listen global events aka mouse presses.
class EventMonitor {
  private var monitor: Any?
  private let mask: NSEvent.EventTypeMask
  private let handler: (NSEvent?) -> Void

  init(mask: NSEvent.EventTypeMask, handler: @escaping (NSEvent?) -> Void) {
    self.mask = mask
    self.handler = handler
  }

  deinit {
    stop()
  }

  func start() {
    monitor = NSEvent.addGlobalMonitorForEvents(matching: mask, handler: handler)
  }

  func stop() {
    if monitor != nil {
      NSEvent.removeMonitor(monitor!)
      monitor = nil
    }
  }
}
