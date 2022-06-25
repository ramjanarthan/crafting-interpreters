//
//  Logger.swift
//  
//
//  Created by S. Ram Janarthana Raja on 25/6/22.
//

import Foundation

class Logger {
  static var isLogEnabled = true
  
  static func log(_ text: String) {
    guard isLogEnabled else {
      return
    }
 
    print(text)
  }
}
