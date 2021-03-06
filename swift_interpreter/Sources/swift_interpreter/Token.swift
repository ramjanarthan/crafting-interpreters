//
//  File.swift
//  
//
//  Created by S. Ram Janarthana Raja on 20/6/22.
//

import Foundation

enum TokenType: String {
  // Single-char tokens
  case LEFT_PAREN, RIGHT_PAREN, LEFT_BRACE, RIGHT_BRACE, COMMA, DOT, MINUS, PLUS, SEMICOLON, SLASH, STAR
  
  // One or two char tokens
  case BANG, BANG_EQUAL, EQUAL, EQUAL_EQUAL, GREATER, GREATER_EQUAL, LESS, LESS_EQUAL, RIGHT, RIGHT_EQUAL
  
  // Literals
  case IDENTIFIER, STRING, NUMBER
  
  // Keywords
  case AND, CLASS, ELSE, FALSE, FUN, FOR, IF, NIL, OR, PRINT, RETURN, SUPER, THIS, TRUE, VAR, WHILE

  case EOF
  
  static var keywordsMap: [String: TokenType] {
    var dict: [String: TokenType] = [:]
    for keyword in keywords {
      dict[keyword.rawValue.lowercased()] = keyword
    }
    
    return dict
  }
  
  static var keywords: [TokenType] {
    return [AND, CLASS, ELSE, FALSE, FUN, FOR, IF, NIL, OR, PRINT, RETURN, SUPER, THIS, TRUE, VAR, WHILE]
  }
}

struct Token {
  let type: TokenType
  let lexeme: String
  let literal: Any?
  let line: Int
  
  func toString() -> String {
    return "\(type) \(lexeme)"
  }
}

extension Token: CustomDebugStringConvertible {
  var debugDescription: String {
    return toString()
  }
}
