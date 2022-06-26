//
//  Error.swift
//  
//
//  Created by S. Ram Janarthana Raja on 25/6/22.
//

import Foundation

enum LoxError: Error, CustomStringConvertible {
  case fileReadingError
  case numberScanningError
  case stringScanningError
  case unexpectedCharacter
  case unclosedCommentError
  
  var description: String {
    switch self {
    case .fileReadingError:
      return "File Reading Error"
    case .numberScanningError:
      return "Number Reading Error"
    case .stringScanningError:
      return "Unterminated string"
    case .unexpectedCharacter:
      return "Unexpected character"
    case .unclosedCommentError:
      return "Unclosed multiline comment"
    }
  }
}
