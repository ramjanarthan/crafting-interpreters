//
//  FileReader.swift
//  
//
//  Created by S. Ram Janarthana Raja on 24/6/22.
//

import Foundation

class FileReader {
  static func readLoxTextFile(name: String) throws -> String? {
    guard let filePath = Bundle.ramModule.url(forResource: name, withExtension: "txt") else {
      return nil
    }

    return try String(contentsOf: filePath, encoding: .utf8)
  }
}

// HACK added because there's an issue with the Bundle module extension generation and i don't care about fixing it now
extension Foundation.Bundle {
    /// Returns the resource bundle associated with the current Swift module.
    static var ramModule: Bundle = {
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
}
