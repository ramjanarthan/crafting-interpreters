//
//  File.swift
//  
//
//  Created by S. Ram Janarthana Raja on 20/6/22.
//

import Foundation

class Scanner {
  private let source: String
  private var tokens: [Token] = []
  
  private var start: String.Index
  private var current: String.Index
  private var line = 1
  
  init(source: String) {
    self.source = source
    self.start = source.startIndex
    self.current = source.startIndex
  }
  
  func scanTokens() -> [Token] {
    while !isAtEnd {
      start = current
      scanToken()
    }
    
    tokens.append(Token(type: .EOF, lexeme: "", literal: nil, line: line))
    return tokens
  }
  
  private func scanToken() {
    let currentChar = advance()
    
    switch currentChar {
    case "(":
      addToken(.LEFT_PAREN)
    case ")":
      addToken(.RIGHT_PAREN)
    case "{":
      addToken(.LEFT_BRACE)
    case "}":
      addToken(.RIGHT_BRACE)
    case ",":
      addToken(.COMMA)
    case ".":
      addToken(.DOT)
    case "-":
      addToken(.MINUS)
    case "+":
      addToken(.PLUS)
    case ";":
      addToken(.SEMICOLON)
    case "*":
      addToken(.STAR)
    case "!":
      addToken(match("=") ? .BANG_EQUAL : .BANG)
    case "=":
      addToken(match("=") ? .EQUAL_EQUAL : .EQUAL)
    case "<":
      addToken(match("=") ? .LESS_EQUAL : .LESS)
    case ">":
      addToken(match("=") ? .RIGHT_EQUAL : .RIGHT)
    case "/":
      if match("/") {
        while peek() != "\n" && !isAtEnd {
          advance()
        }
      } else {
        addToken(.SLASH)
      }
    case " ", "\r", "\t":
      break
    case "\n":
      line += 1
    case "\"":
      handleString()
    default:
      Lox.throwError(line: line, message: "Unexpected character")
      break
    }
  }
}

// MARK: Tokens manipulation methods
extension Scanner {
  private func addToken(_ type: TokenType) {
    addToken(type, literal: nil)
  }
  
  private func addToken(_ type: TokenType, literal: Any?) {
    let text = source[start..<current]
    tokens.append(Token(type: type, lexeme: String(text), literal: literal, line: line))
  }
}

// MARK: Index Manipulation methods
extension Scanner {
  @discardableResult private func advance() -> Character {
    let index = current
    incrementCurrent()
    return source[index]
  }
  
  private func match(_ expected: Character) -> Bool {
    guard !isAtEnd else {
      return false
    }
    
    if (source[current] != expected) {
      return false
    }
    
    incrementCurrent()
    return true
  }
  
  private func peek() -> Character {
    guard !isAtEnd else {
      return "\0"
    }
    
    return source[current]
  }
  
  private func handleString() {
    while peek() != "\"" && !isAtEnd {
      if peek() == "\n" {
        line += 1
      }
      advance()
    }
    
    if isAtEnd {
      Lox.throwError(line: line, message: "Unterminated string")
      return
    }
    
    advance()
    
    let literalStartIndex = source.index(after: start)
    let literalEndIndex = source.index(before: current)
    
    if literalEndIndex < literalStartIndex {
      addToken(.STRING, literal: "")
    } else {
      addToken(.STRING, literal: source[literalStartIndex...literalEndIndex])
    }
  }
}


// MARK: Helper methods
extension Scanner {
  private var isAtEnd: Bool {
    return source.endIndex == current
  }
  
  private func incrementCurrent() {
    Logger.log("incrementing \(current) to \(source.index(after: current))")
    current = source.index(after: current)
  }
}
