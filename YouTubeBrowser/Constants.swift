//
//  Constants.swift
//  YouTubeBrowser
//
//  Created by Anton Aleshkevich on 16/09/2018.
//  Copyright © 2018 Anton Aleshkevich. All rights reserved.
//

import Cocoa
import WebKit

enum Constants {
  enum WebKit {
    /// We should change WebKit user agent to get access to dark theme of YouTube.
    static let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_3) " +
      "AppleWebKit/602.4.8 (KHTML, like Gecko) Version/10.0.3 Safari/602.4.8"

    static let mediaTypesRequiringUserActionForPlayback: WKAudiovisualMediaTypes = .all
  }

  /// List of embedded urls
  enum PageUrls: String {
    case home = "https://www.youtube.com/"
  }
}
