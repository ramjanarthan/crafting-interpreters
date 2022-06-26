//
//  FileReader.swift
//  
//
//  Created by S. Ram Janarthana Raja on 24/6/22.
//

import Foundation

class FileReader {
  static func readLoxTextFile(name: String, isTest: Bool = false) throws -> String? {
    let bundle: Bundle = isTest ? Bundle.testModule : Bundle.prodModule
    
    guard let filePath = bundle.url(forResource: name, withExtension: "txt") else {
      return nil
    }

    return try String(contentsOf: filePath, encoding: .utf8)
  }
}

// HACK added because there's an issue with the Bundle module extension generation and i don't care about fixing it now
extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var prodModule: Bundle = {
        let bundleName = "swift_interpreter_swift_interpreter"

        let candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named swift_interpreter_swift_interpreter")
    }()
  
  static var testModule: Bundle = {
      let bundleName = "swift_interpreter_swift_interpreterTests"

      let candidates = [
          // Bundle should be present here when the package is linked into an App.
          Bundle.main.resourceURL,

          // For command-line tools.
          Bundle.main.bundleURL,
      ]

      for candidate in candidates {
          let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
          if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
              return bundle
          }
      }
      fatalError("unable to find bundle named swift_interpreter_swift_interpreterTests")
  }()
}
