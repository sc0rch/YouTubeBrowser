//
//  SwinjectAssembler.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Foundation
import Swinject

class SwinjectAssembler {
  static let shared: SwinjectAssembler = {
    // https://github.com/Swinject/Swinject/issues/218
    Container.loggingFunction = nil
    return SwinjectAssembler()
  }()

  /// Every story has its own container for dependencies.
  private let assembler = Assembler([
    MainAssembly()
  ])

  /// SwinjectStoryboard is not working in macOS for some reason,
  /// so we resolve dependencies by hand.
  static func resolve<T>(_ type: T.Type) -> T? {
    return SwinjectAssembler.shared.assembler.resolver.resolve(type)
  }
}
