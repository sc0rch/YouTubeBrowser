//
//  MainAssembly.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Foundation
import Swinject

class MainAssembly: Assembly {
  func assemble(container: Container) {
    container.register(MainRouterProtocol.self) { _ in
      MainRouter()
    }

    container.register(MainPresenterProtocol.self) { r in
      let mainRouter = r.resolve(MainRouterProtocol.self)!
      return MainPresenter(mainRouter: mainRouter)
    }.inObjectScope(.container)
  }
}
