//
//  WebCacheCleaner.swift
//  SpectrumIntegration
//
//  Created by Tom Falkner on 8/26/19.
//  Copyright © 2019 Pollinate. All rights reserved.
//

import Foundation
import WebKit

final class WebCacheCleaner {
  
  class func clean() {
    HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
    print("[WebCacheCleaner] All cookies deleted")
    
    WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
      records.forEach { record in
        WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
        print("[WebCacheCleaner] Record \(record) deleted")
      }
    }
  }
}
