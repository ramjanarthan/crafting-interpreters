//
//  File.swift
//  
//
//  Created by S. Ram Janarthana Raja on 20/6/22.
//

import Foundation

enum TokenType {
  // Single-char tokens
  case LEFT_PAREN, RIGHT_PAREN, LEFT_BRACE, RIGHT_BRACE, COMMA, DOT, MINUS, PLUS, SEMICOLON, SLASH, STAR
  
  // One or two char tokens
  case BANG, BAN_EQUAL, EQUAL, EQUAL_EQUAL, GREATER, GREATER_EQUAL, LESS, LESS_EQUAL
  
  // Literals
  case IDENTIFIER, STRING, NUMBER
  
  // Keywords
  case AND, CLASS, ELSE, FALSE, FUN, FOR, IF, NIL, OR, PRINT, RETURN, SUPER, THIS, TRUE, VAR, WHILE

  case EOF
}

struct Token {
  let type: TokenType
  let lexeme: String
  let literal: Any
  let line: Int
  
  func toString() -> String {
    return "\(type) \(lexeme) \(literal)"
  }
}
